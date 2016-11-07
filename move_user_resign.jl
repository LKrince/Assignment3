using SQLite
time_start = time()
DB = SQLite.DB(ARGS[1])
move_number = length(SQLite.query(DB,"SELECT move_number FROM moves;")[1]) + 1
SQLite.execute!(DB,"INSERT INTO moves VALUES($move_number,\"resign\",NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)")



time_end = time()
if_limit = SQLite.query(DB,"select value from meta where key = \"timed\"")[1].values[1]
if if_limit == "yes"
  #check side
  side = length(SQLite.query(DB,"SELECT move_number FROM moves;")[1])%2
  time_move = Int(floor(time_end-time_start+0.5))
  time_add = parse(SQLite.query(DB,"select value from meta where key = \"time_add\"")[1].values[1])
  if side == 1
    time_left = parse(SQLite.query(DB,"select value from meta where key = \"sente_time\"")[1].values[1])
    time_left = time_left + time_add - time_move
    SQLite.execute!(DB,"update meta set value = \"$time_left\" where key = \"sente_time\"")
  else
    time_left = parse(SQLite.query(DB,"select value from meta where key = \"gote_time\"")[1].values[1])
    time_left = time_left + time_add - time_move
    SQLite.execute!(DB,"update meta set value = \"$time_left\" where key = \"gote_time\"")
  end
end
