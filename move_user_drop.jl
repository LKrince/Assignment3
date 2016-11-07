using SQLite
DB = SQLite.DB(ARGS[1])
#get current move_id
time_start= time()
move_number = length(SQLite.query(DB,"SELECT move_number FROM moves;")[1]) + 1
token = ARGS[2]
targetx = ARGS[3]
targety = ARGS[4]
SQLite.query(DB,"INSERT INTO moves VALUES($move_number,
                                          \"drop\",
                                          NULL,
                                          NULL,
                                          $targetx,
                                          $targety,
                                          \"$token\",
                                          NULL,
                                          NULL,
                                          NULL)")
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
