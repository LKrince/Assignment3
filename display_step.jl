using SQLite

function getCurrentBoard_step(DB,step)
  DB = SQLite.DB(DB)
  black_die = Array{String}(0)
  white_die = Array{String}(0)
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
    global board= ["l0" "f0" "c0" "s0" "g0" "k0" "e0" "g0" "s0" "c0" "f0" "l0";
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
                   "l1" "f1" "c1" "s1" "g1" "e1" "k1" "g1" "s1" "c1" "f1" "l1";
                   ]
  end
  step_length = length(SQLite.query(DB,"SELECT move_number FROM moves;")[1])
  if step > step_length
    step = step_length
  end
  if step < 1
    step = 1
  end
  for i = 1:step
    global turn = i % 2 == 0 ? "0" : "1"
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
      global option = string(SQLite.query(DB,"SELECT option FROM moves WHERE \"move_number\" = $i;")[1].values[1])
    catch
      global option = "NULL"
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
    if move_type == "move"
      if board[targetx,targety] != " "
        if board[targetx,targety][2] == '1'
          push!(black_die,lowercase(string(board[targetx,targety])))
          board[targetx,targety] = board[sourcex,sourcey]
          board[sourcex,sourcey] = " "
        else
          push!(white_die,lowercase(string(board[targetx,targety])))
          board[targetx,targety] = board[sourcex,sourcey]
          board[sourcex,sourcey] = " "
        end
      else
        board[targetx,targety] = board[sourcex,sourcey]
        board[sourcex,sourcey] = " "
      end

      if targetx2 != -1 && targety2 != -1
        if board[targetx2,targety2] !=" "
          if board[targetx2,targety2][2] == '1'
            push!(black_die,lowercase(string(board[targetx2,targety2])))
            board[targetx2,targety2] = board[stargetx,targety]
            board[targetx,targety] = " "
          else
            push!(white_die,lowercase(string(board[targetx2,targety2])))
            board[targetx2,targety2] = board[targetx,targety]
            board[targetx,targety] = " "
          end
        else
          board[targetx2,targety2] = board[targetx,targety]
          board[targetx,targety] = " "
        end
      end
      if option == "!"
        if targetx2 != -1 && targety2 != -1
          board[targetx2,targety2] = uppercase(board[targetx2,targety2])
        else
          board[targetx,targety] = uppercase(board[targetx,targety])
        end
      end
    elseif move_type == "resign"
      return board,black_die,white_die
    elseif move_type == "drop"
      #delete from die array
      if turn == "1"
        piece_index = findfirst(white_die,option*"0")
        if piece_index != 0
          deleteat!(white_die,piece_index)
        end
      else
        piece_index = findfirst(black_die,option*"1")
        if piece_index != 0
          deleteat!(black_die,piece_index)
        end
      end

      #check target location
      if board[targetx,targety] != " "
        if board[targetx,targety][2] =='1'
          push!(black_die,lowercase(string(board[targetx,targety])))
        else
          push!(white_die,lowercase(string(board[targetx,targety])))
        end
      end
      #place piece
      drop_piece = option*turn
      board[targetx,targety] = drop_piece
    else
      exit()
    end
  end

  return board,black_die,white_die
end

function display_step(board,black_die,white_die)
  x,y = size(board)
  print("\n\n   ")
  for i = 0 : x - 1
    print_with_color(:cyan,"   ",string('a' + i))
  end
  println()
  for i = 1: 2*y + 1
    if i % 2 == 1
      print("    +")
    else
      if Int(i/2)<10
        print_with_color(:cyan," ",string(Int(i/2)))
        print("  |")
      else
        print_with_color(:cyan," ",string(Int(i/2)))
        print(" |")
      end

    end
    for j = 1:x
      if i % 2 == 1
        print("---+")
      else
        print(" ")
        if length(board[j,Int(i/2)]) < 2
          print(" ")
        else
          if board[j,Int(i/2)][2] == '0'
            print_with_color(board[j,Int(i/2)][1] == 'k'? :yellow : :bold,string(board[j,Int(i/2)][1]))
          else
            print_with_color(board[j,Int(i/2)][1] == 'k'? :yellow : :black,string(board[j,Int(i/2)][1]))
          end
        end
        print(" |")
      end
    end
    if i % 2 == 0
      print_with_color(:cyan," ",string(Int(i/2)))
    end
    println()
  end
  print("   ")
  for i = 0 : x - 1
    print_with_color(:cyan,"   ",string('a' + i))
  end


  println("\nDrop Token")
  println("Black_die: ",black_die)
  println("White_die: ",white_die)
end

data_file = ARGS[1]
option_step = 1
displacement = " "
board,black_die,white_die = getCurrentBoard_step(data_file,option_step)
display_step(board,black_die,white_die)
println("Enter the step the number of steps you want to see: ")
println("Enter \"F\" to go forward, Enter \"B\" to go backward.")
println("Enter 0 to exit")
displacement = readline()

if displacement[1] == 'F'
  option_step = option_step + 1
elseif displacement[1] == 'B'
  option_step = option_step - 1
else
  option_step = parse(displacement)
end

while (displacement[1] != '0')
  board,black_die,white_die = getCurrentBoard_step(data_file,option_step)
  display_step(board,black_die,white_die)
  println("Enter the step the number of steps you want to see: ")
  println("Enter \"F\" to go forward, Enter \"B\" to go backward.")

  displacement = readline()
  if displacement[1] == 'F'
    option_step = option_step + 1
  elseif displacement[1] == 'B'
    option_step = option_step - 1
  else
    option_step = parse(displacement)
  end

end
