using SQLite
include("AI.jl")
#define board
DB = SQLite.DB(ARGS[1])
died_token = Array{String}(0)
board_type = SQLite.query(DB,"SELECT value FROM meta WHERE key = \"type\";")[1].values[1]

if board_type == "standard"
  global board = ["l0" "n0" "s0" "g0" "k0" "g0" "s0" "n0" "l0";
              " " "b0" " " " " " " " " " " "r0" " ";
              "p0" "p0" "p0" "p0" "p0" "p0" "p0" "p0" "p0";
              " " " " " " " " " " " " " " " " " ";
              " " " " " " " " " " " " " " " " " ";
              " " " " " " " " " " " " " " " " " ";
              "p1" "p1" "p1" "p1" "p1" "p1" "p1" "p1" "p1";
              " " "r1" " " " " " " " " " " "b1" " ";
              "l1" "n1" "s1" "g1" "k1" "g1" "s1" "n1" "l1";]
elseif board_type == "minishogi"
  global board = ["k0" "g0" "s0" "b0" "r0";
    "p0" " " " " " " " ";
    " " " " " " " " " ";
    " " " " " " " " "p1";
    "r1" "b1" "s1" "g1" "k1";]
else
  global board =  ["l0" "f0" "c0" "s0" "g0" "k0" "e0" "g0" "s0" "c0" "f0" "l0";
           "a0" " " "b0" " " "t0" "n0" "x0" "t0" " " "b0" " " "a0";
           "m0" "v0" "r0" "h0" "d0" "i0" "q0" "d0" "h0" "r0" "v0" "m0";
           "p0" "p0" "p0" "p0" "p0" "p0" "p0" "p0" "p0" "p0" "p0" "p0";
           " " " " " " "o0" " " " " " " " " "o0" " " " " " ";
           " " " " " " " " " " " " " " " " " " " " " " " ";
           " " " " " " " " " " " " " " " " " " " " " " " ";
           " " " " " " "o1" " " " " " " " " "o1" " " " " " ";
           "p1" "p1" "p1" "p1" "p1" "p1" "p1" "p1" "p1" "p1" "p1" "p1";
           "m1" "v1" "r1" "h1" "d1" "q1" "i1" "d1" "h1" "r1" "v1" "m1";
           "a1" " " "b1" " " "t1" "x1" "n1" "t1" " " "b1" " " "a1";
           "l1" "f1" "c1" "s1" "g1" "e1" "k1" "g1" "s1" "c1" "f1" "l1";]
end

#define situation
flag = true
#replay game and trace every moves
for i = 1:length(SQLite.query(DB,"SELECT move_number FROM moves;")[1])
  global turn = i % 2 == 0 ? "0" : "1"
  #update move_vars
  move_type = SQLite.query(DB,"SELECT move_type FROM moves WHERE \"move_number\" = $i;")[1].values[1]
  try
    global sourcex = SQLite.query(DB,"SELECT sourcex FROM moves WHERE \"move_number\" = $i;")[1].values[1]
  catch
    global sourcex = -1
  end
  try
    global sourcey = SQLite.query(DB,"SELECT sourcey FROM moves WHERE \"move_number\" = $i;")[1].values[1]
  catch
    global sourcey = -1
  end
  try
    global targetx = SQLite.query(DB,"SELECT targetx FROM moves WHERE \"move_number\" = $i;")[1].values[1]
  catch
    global targetx = -1
  end
  try
    global targety = SQLite.query(DB,"SELECT targety FROM moves WHERE \"move_number\" = $i;")[1].values[1]
  catch
    global targety = -1
  end
  try
    global targetx2 = SQLite.query(DB,"SELECT targetx2 FROM moves WHERE \"move_number\" = $i;")[1].values[1]
  catch
    global targetx2 = -1
  end
  try
    global targety2 = SQLite.query(DB,"SELECT targety2 FROM moves WHERE \"move_number\" = $i;")[1].values[1]
  catch
    global targety2 = -1
  end
  try
    global option = string(SQLite.query(DB,"SELECT option FROM moves WHERE \"move_number\" = $i;")[1].values[1])
  catch
    global option = "NULL"
  end

  if board_type != "chu"
    #validating depends on mvoe_type
    if move_type == "move"
      #token does not exist
      if board[sourcex,sourcey] == " "
        print(i," ")
        flag = false
        break
      #moves opponent token
      elseif string(board[sourcex,sourcey][2]) != turn
          print(i," ")
          flag = false
          break
      #cant eat friend
      elseif board[targetx,targety] != " " && string(board[targetx,targety][2]) == turn
            print(i," ")
            flag = false
            break
      #cant promte in unpromoteble area
      elseif option == "!"
        if board[sourcex,sourcey][1] == 'k' || board[sourcex,sourcey][1] == 'g'
          print(i," ")
          flag = false
          break
        end
        if board_type == "standard"
          if turn == "0" #white
            if targetx < 7
              print(i," ")
              flag = false
              break
            end
          else
            if targetx > 3
              print(i," ")
              flag = false
              break
            end
          end
        else
          if turn == "0" #white
            if targetx < 5
              print(i," ")
              flag = false
              break
            end
          else
            if targetx > 1
              print(i," ")
              flag = false
              break
            end
          end
        end
      end
      valid_move = Tree.getAllMovesChar(board,board_type,sourcex,sourcey,parse(turn))
      j = 1
      check = false
      while j < length(valid_move)
        check_valid=(sourcex+valid_move[j],sourcey+valid_move[j+1])
        if (targetx,targety) == check_valid
          check = true
          if board[targetx,targety] != " "
            push!(died_token,string(board[targetx,targety][1])*turn)
          end
          if option == "!"
            board[targetx,targety] = uppercase(board[sourcex,sourcey])
            board[sourcex,sourcey] = " "
            break
          else
            board[targetx,targety] = board[sourcex,sourcey]
            board[sourcex,sourcey] = " "
            break
          end
        end
        j = j + 2
      end
      if !check
        print(i," ")
        flag = false
        break
      end
    elseif move_type == "drop"
      if option == "p"
        xzhou,yzhou = size(board)
        for j = 1:xzhou
          if board[j,targety] == option*turn
            println(i," ")
            flag = false
            break
          end
        end
      end
      if option == "n"
        if turn == "0" #white
          if targetx > 7
            print(i," ")
            flag = false
            break
          end
        else
          if targetx < 3
            print(i," ")
            flag = false
            break
          end
        end
      end

      index = 0
      #find index
      for k = 1:length(died_token)
        if died_token[k] == option * turn
          index = k
          break
        end
      end
      #died token dne
      if index == 0
        print(i," ")
        flag = false
        break
      #died token existed & droped place has token
      elseif board[targetx,targety] != " "
        print(i," ")
        flag = false
        break
      #died token existed
      else
        board[targetx,targety] = option * turn
        deleteat!(died_token,index)
      end
    elseif move_type == "resign"
      break
    end
  else
    #validating depends on mvoe_type
    if move_type == "move"
      #token does not exist
      if board[sourcex,sourcey] == " "
        print(i," ")
        flag = false
        break
      #moves opponent token
      elseif string(board[sourcex,sourcey][2]) != turn
          print(i," ")
          flag = false
          break
      #cant eat friend
      elseif board[targetx,targety] != " " && string(board[targetx,targety][2]) == turn
            print(i," ")
            flag = false
            break
      #cant promte in unpromoteble area
      elseif option == "!"
        if board[sourcex,sourcey][1] == 'k' ||board[sourcex,sourcey][1] == 'q' || board[sourcex,sourcey][1] == 'i'
          print(i," ")
          flag = false
          break
        end
        if isupper(board[sourcex,sourcey][1])
          print(i," ")
          flag = false
          break
        end
        if turn == "0" #white
          if targetx < 9
            print(i," ")
            flag = false
            break
          end
        else
          if targetx > 4
            print(i," ")
            flag = false
            break
          end
        end
      end
      valid_move = Tree.getAllMovesChar(board,board_type,sourcex,sourcey,parse(turn))
      check = false
      if targetx2 == -1
        j = 1
        while j < length(valid_move)
          check_valid=(sourcex+valid_move[j],sourcey+valid_move[j+1])
          if (targetx,targety) == check_valid
            check = true
            if option == "!"
              board[targetx,targety] = uppercase(board[sourcex,sourcey])
              board[sourcex,sourcey] = " "
              break
            else
              board[targetx,targety] = board[sourcex,sourcey]
              board[sourcex,sourcey] = " "
              break
            end
          end
          j = j + 2
        end
      else
        if board[sourcex,sourcey][1] == 'H'
          if turn == "0"
            if (targetx,targety) == (sourcex+1,sourcey)
              if (targetx2,targety2) == (targetx+1,targety)
                check = true
                board[targetx2,targety2] = board[sourcex,sourcey]
                board[targetx,targety] = " "
                board[sourcex,sourcey] = " "
              elseif (targetx2,targety2) == (sourcex,sourcey)
                check = true
                board[targetx,targety] = " "
              end
            end
          else
            if (targetx,targety) == (sourcex-1,sourcey)
              if (targetx2,targety2) == (targetx-1,targety)
                check = true
                board[targetx2,targety2] = board[sourcex,sourcey]
                board[targetx,targety] = " "
                board[sourcex,sourcey] = " "
              elseif (targetx2,targety2) == (sourcex,sourcey)
                check = true
                board[targetx,targety] = " "
              end
            end
          end
        elseif board[sourcex,sourcey][1] == 'D'
          if turn == "0"
            if (targetx,targety) == (source+1,sourcey-1)
              if (targetx2,targety2) == (targetx+1,targety-1)
                check = true
                board[targetx2,targety2] = board[sourcex,sourcey]
                board[targetx,targety] = " "
                board[sourcex,sourcey] = " "
              elseif (targetx2,targety2) == (sourcex,sourcey)
                check = true
                board[targetx,targety] = " "
              end
            elseif (targetx,targety) == (sourcex+1,sourcey+1)
              if (targetx2,targety2) == (targetx+1,targety+1)
                check = true
                board[targetx2,targety2] = board[sourcex,sourcey]
                board[targetx,targety] = " "
                board[sourcex,sourcey] = " "
              elseif (targetx2,targety2) == (sourcex,sourcey)
                check = true
                board[targetx,targety] = " "
              end
            end
          else
            if (targetx,targety) == (sourcex-1,sourcey-1)
              if (targetx2,targety2) == (targetx-1,targety-1)
                check = true
                board[targetx2,targety2] = board[sourcex,sourcey]
                board[targetx,targety] = " "
                board[sourcex,sourcey] = " "
              elseif (targetx2,targety2) == (sourcex,sourcey)
                check = true
                board[targetx,targety] = " "
              end
            elseif (targetx,targety) == (sourcex-1,sourcey+1)
              if (targetx2,targety2) == (targetx-1,targety+1)
                check = true
                board[targetx2,targety2] = board[sourcex,sourcey]
                board[targetx,targety] = " "
                board[sourcex,sourcey] = " "
              elseif (targetx2,targety2) == (sourcex,sourcey)
                check = true
                board[targetx,targety] = " "
              end
            end
          end
        elseif board[sourcex,sourcey][1] == 'i' || board[sourcex,sourcey][1] == 'N'
          j=1
          while j < length(valid_move)
            check_valid=(sourcex+valid_move[j],sourcey+valid_move[j+1])
            if (targetx,targety) == check_valid && (abs(valid_move[j]) == 2 || abs(valid_move[j+1] == 2))
              break
            elseif abs(targetx2-targetx) == 2 || abs(targety2-targety) == 2
              break
            elseif (targetx,targety) == check_valid && string(board[sourcex,sourcey][2]) == turn
              board[targetx,targety] = board[sourcex,sourcey]
              board[sourcex,sourcey] = " "
              valid_second_move = Tree.getAllMovesChar(board,board_type,targetx,targety,parse(turn))
              k=1
              while k < length(valid_second_move)
                check_valid=(targetx+valid_second_move[k],targety+valid_second_move[k+1])
                if check_valid == (targetx2,targety2)
                  check = true
                  board[targetx2,targety2] = board[targetx,targety]
                  board[targetx,targety] = " "
                  break
                end
                k=k+2
              end
              break
            end
            j=j+2
          end
        end
      end
      if !check
        print(i," ")
        flag = false
        break
      end
    end
  end
end
if flag
  println("0")
end
