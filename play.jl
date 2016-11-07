using SQLite
include("support_functions.jl")
#run(`julia display.jl chess`)

function start_interface()
  brand()
  meun()

  option = readline()
  try
    option = parse(option)
  catch
    option = option
  end

  while (option != 3 && option != "exit" && option != "Exit")


    if option == 1 || option == "Play" || option == "play"

      println("For play standard shogi, enter 1 \; ")
      println("For play mini shogi , enter 2 \; ")
      println("For play chu shogi, enter 3\;")
      shogi_type = parse(readline())
      println("Would you like cheating mode ;
      Enter 1 to allow cheating mode ;
      Enter 2 dont allow cheating mode ;")
      cheating_mode = parse(readline())
      if shogi_type == 1
        shogi_type = "S"
      elseif shogi_type == 3
        shogi_type ="C"
      else
        shogi_type = "M"
      end

      if cheating_mode == 1
        cheating_mode = "T"
      else
        cheating_mode = " "
      end
      println("Enter the time limit, enter 0 to turn off time limit: ")
      time_limit = parse(readline())
      time_add = 0
      if time_limit != 0
        println("Enter the time add after each step ")
        time_add = parse(readline())
      end
      #start name file
      new_game = "new_game"
      run(`julia start.jl $new_game $shogi_type $cheating_mode $time_limit $time_add`)
      # pick side
      println("Enter \"W\" for whith side, Enter \"B\" for black side")
      side = readline()[1]
      println("You chose $side ")
      if side == 'W' || side =='w'
        side = 0
      else
        side = 1
      end
      #start game
      run(`julia --color=yes -- display.jl $new_game`)
      if shogi_type == "S" || shogi_type == "M"
        chess_game_MORS(new_game,side)
      else
        chess_game_CHO(new_game,side)
      end

    elseif option == 3 || option == "exit" || option == "Exit"
      return
    else
      about()
    end

    meun()
    option = readline()
    try
      option = parse(option)
    catch
      option = option
    end

  end

  return
end

function chess_game_MORS(new_game,side)
  #get each parameter
  move_number = 1
  DB = SQLite.DB(new_game)
  while (wingame(DB)== "?")
    println("move_number : $move_number")
    if move_number%2 == side
      println("your turn:  ")
      println("move_type can be: move,resign,or drop")
      println("move_format: move_type sourceX sourceY targetX targetY option")
      println("drop_format: move_type option targetX targetY")
      println("resign_format: move_type")
      println("option can be: T or nothing\(T for promote\)")
      move_code = strip(readline())
      move_code_array = split(move_code,' ')

      move_type = move_code_array[1]
      if move_type == "move"
        option = "NULL"
        targetX2 ="NULL"
        targetY2 ="NULL"
        if search(move_code,'T') != 0
          sourceX = move_code_array[2]
          sourceY = move_code_array[3]
          targetX = move_code_array[4]
          targetY = move_code_array[5]
          option = move_code_array[6]
          run(`julia move_user_move.jl $new_game $sourceX $sourceY $targetX $targetY $option $targetX2 $targetY2`)
        else
          sourceX = move_code_array[2]
          sourceY = move_code_array[3]
          targetX = move_code_array[4]
          targetY = move_code_array[5]
          run(`julia move_user_move.jl $new_game $sourceX $sourceY $targetX $targetY $targetX2 $targetY2`)
        end

      elseif move_type == "drop"
        option = move_code_array[2]
        targetX = move_code_array[3]
        targetY = move_code_array[4]
        run(`julia move_user_drop.jl $new_game $option $targetX $targetY`)
      else
        run(`julia move_user_resign.jl $new_game`)
      end
    else
      println("AI is moving : ")
      sleep(1)
      run(`julia move.jl $new_game`)
    end
    run(`julia --color=yes -- display.jl $new_game`)
    move_number = move_number+1
  end
  if (wingame(DB) == "B")
    if (side == 1)
      println(" YOU WIN! ")
    else
      println(" YOU LOST")
    end
  else
    if (side == 0)
      println(" YOU WIN! ")
    else
      println(" YOU LOST")
    end
  end

end

function chess_game_CHO(new_game,side)
  #get each parameter
  move_number = 1
  DB = SQLite.DB(new_game)
  while (wingame(DB)== "?")
    println("move_number : $move_number")
    if move_number%2 == side
      println("your turn:  ")
      println("move_type can be: move,resign")
      println("move_format: move_type sourceX sourceY targetX targetY option targetX targetY")
      println("resign_format: move_type")
      println("option can be: T or nothing\(T for promote\)")
      move_code = strip(readline())
      move_code_array = split(move_code,' ')

      move_type = move_code_array[1]
      if move_type == "move"
        option ="NULL"
        targetX2 ="NULL"
        targetY2 ="NULL"
        if search(move_code,'T') != 0
          sourceX = move_code_array[2]
          sourceY = move_code_array[3]
          targetX = move_code_array[4]
          targetY = move_code_array[5]
          option = move_code_array[6]
          if length(move_code_array) >=8
            targetX2 =move_code_array[7]
            targetY2 =move_code_array[8]
          end
          run(`julia move_user_move.jl $new_game $sourceX $sourceY $targetX $targetY $option $targetX2 $targetY2`)
        else
          sourceX = move_code_array[2]
          sourceY = move_code_array[3]
          targetX = move_code_array[4]
          targetY = move_code_array[5]
          if length(move_code_array)>=7
            targetX2 =move_code_array[6]
            targetY2 =move_code_array[7]
          end
          run(`julia move_user_move.jl $new_game $sourceX $sourceY $targetX $targetY $targetX2 $targetY2`)
        end

      else
        run(`julia move_user_resign.jl $new_game`)
      end
    else
      println("AI is moving : ")
      sleep(1)
      run(`julia move.jl $new_game`)
    end
    run(`julia --color=yes -- display.jl $new_game`)
    move_number = move_number+1
  end
  if (wingame(DB) == "B")
    if (side == 1)
      println(" YOU WIN! ")
    else
      println(" YOU LOST")
    end
  else
    if (side == 0)
      println(" YOU WIN! ")
    else
      println(" YOU LOST")
    end
  end

end





function wingame(DB)
  using SQLite

  DB = SQLite.DB(ARGS[1])
  timed = SQLite.query(DB,"SELECT value FROM meta WHERE key = \"timed\";")[1].values[1]
  move_number = length(SQLite.query(DB,"SELECT move_number FROM moves;")[1])
  board_type = SQLite.query(DB,"SELECT value FROM meta WHERE key = \"type\";")[1].values[1]
  flag = true
  if board_type == "standard"
    kings=[(1,5),(9,5)]
  elseif board_type == "minishogi"
    kings=[(1,1),(5,5)]
  else
    kings_white=[(1,6)]
    kings_black=[(12,7)]
    drunk_white=[(1,7)]
    drunk_black=[(12,6)]
    princes_black=[]
    princes_white=[]
  end

  if timed == "yes"
    sente_time = parse(SQLite.query(DB, "SELECT value FROM meta WHERE key = \"sente_time\";")[1].values[1])
    gote_time = parse(SQLite.query(DB, "SELECT value FROM meta WHERE key = \"gote_time\";")[1].values[1])
    if sente_time == 0
      return("W")
      flag = false
    elseif gote_time == 0
      return("B")
      flag = false
    end
  end

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
      #resign
      if move_type == "resign"
        return(turn == "1"?"R":"r")
        flag = false
        break
      elseif move_type == "move" || move_type == "drop"
        if (targetx,targety) == kings[1]
          return("SM")
          return("B")
          flag = false
          break
        elseif (targetx,targety) == kings[2]
          return("W")
          flag = false
          break
        end
        if (sourcex,sourcey) == kings[1]
          kings[1] = (targetx,targety)
        elseif (sourcex,sourcey) == kings[2]
          kings[2] = (targetx,targety)
        end
      end
    else
      #resign
      if move_type == "resign"
        return(turn == "1"?"R":"r")
        flag = false
        break
      elseif move_type == "move"
        if length(kings_white) != 0
          if (targetx,targety) == kings_white[1]
            if length(princes_white) == 0
              return("B")
              flag = false
              break
            else
              deleteat!(kings_white,1)
            end
          elseif (sourcex,sourcey) == kings_white[1]
              kings_white[1] = (targetx,targety)
          end
        elseif length(kings_white) == 0
          if (targetx,targety) == princes_white[1]
            return("B")
            flag = false
            break
          end
        end
        if length(kings_black) != 0
          if (targetx,targety) == kings_black[1]
            if length(princes_black) == 0
              return("W")
              flag = false
              break
            else
              deleteat!(kings_black,1)
            end
          elseif (sourcex,sourcey) == kings_black[1]
              kings_black[1] = (targetx,targety)
          end
        elseif length(kings_black) == 0
          if (targetx,targety) == princes_black[1]
            return("W")
            flag = false
            break
          end
        end
        if length(princes_white) != 0
          if (sourcex,sourcey) == princes_white[1]
            princes_white[1] = (targetx,targety)
          elseif (targetx,targety)  == princes_white[1]
            deleteat!(princes_white,1)
          end
        end
        if length(princes_black) != 0
          if (sourcex,sourcey) == princes_black[1]
            princes_black[1] = (targetx,targety)
          elseif (targetx,targety)  == princes_black[1]
            deleteat!(princes_black,1)
          end
        end
        if length(drunk_white) != 0
          if (sourcex,sourcey) == drunk_white[1]
            if option == "!"
              deleteat!(drunk_white,1)
              push!(princes_white, (targetx,targety))
            else
              drunk_white[1] = (targetx,targety)
            end
          elseif (targetx,targety) == drunk_white[1]
            deleteat!(drunk_white,1)
          end
        end
        if length(drunk_black) != 0
          if (sourcex,sourcey) == drunk_black[1]
            if option == "!"
              deleteat!(drunk_black,1)
              push!(princes_black,(targetx,targety))
            else
              drunk_black[1] = (targetx,targety)
            end
          elseif (targetx,targety) == drunk_black[1]
            deleteat!(drunk_black,1)
          end
        end
      end
    end
  end
  #game's on
  if flag
    return("?")
  end

end




start_interface()
