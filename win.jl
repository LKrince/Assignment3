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
  sente_time = SQLite.query(DB, "SELECT value FROM meta WHERE key = \"sente_time\";")[1].values[1]
  gote_time = SQLite.query(DB, "SELECT value FROM meta WHERE key = \"gote_time\";")[1].values[1]
  if sente_time == 0
    println("W")
    flag = false
  elseif gote_time == 0
    println("B")
    flag = false
  end
end

if board_type != "chu"
  for i = 1 : move_number
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
    #resign
    if move_type == "resign"
      println(turn == "1"?"R":"r")
      flag = false
      break
    elseif move_type == "move" || move_type == "drop"
      if (targetx,targety) == kings[1]
        println("B")
        flag = false
        break
      elseif (targetx,targety) == kings[2]
        println("W")
        flag = false
        break
      end
      if (sourcex,sourcey) == kings[1]
        kings[1] = (targetx,targety)
      elseif (sourcex,sourcey) == kings[2]
        kings[2] = (targetx,targety)
      end
    end
  end
else
  for i = 1 : move_number
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
    #resign
    if move_type == "resign"
      println(turn == "1"?"R":"r")
      flag = false
      break
    elseif move_type == "move" || move_type == "drop"
      if length(kings_white) != 0
        if (targetx,targety) == kings_white[1]
          if length(princes_white) == 0
            println("B")
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
          println("B")
          flag = false
          break
        elseif (sourcex,sourcey) == princes_white[1]
            princes_white[1] = (targetx,targety)
        end
      end
      if length(kings_black) != 0
        if (targetx,targety) == kings_black[1]
          if length(princes_black) == 0
            println("W")
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
          println("W")
          flag = false
          break
        elseif (sourcex,sourcey) == princes_black[1]
            princes_black[1] = (targetx,targety)
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
  println("?")
end
