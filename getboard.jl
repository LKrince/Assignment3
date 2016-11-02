using SQLite

function getCurrentBoard(DB)
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
  for i = 1:length(SQLite.query(DB,"SELECT move_number FROM moves;")[1])
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
