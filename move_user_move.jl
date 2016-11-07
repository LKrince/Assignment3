using SQLite
time_start = time()
DB = SQLite.DB(ARGS[1])
move_number = length(SQLite.query(DB,"SELECT move_number FROM moves;")[1]) + 1
sourcex = ARGS[2]
sourcey = ARGS[3]
targetx = ARGS[4]
targety = ARGS[5]

if length(ARGS) == 5
  SQLite.query(DB,"INSERT INTO moves VALUES($move_number,
                                          \"move\",
                                          $sourcex,
                                          $sourcey,
                                          $targetx,
                                          $targety,
                                          NULL,
                                          NULL,
                                          NULL,
                                          NULL)")
elseif length(ARGS) == 6
  promote = ARGS[6] == "T" ? "!" : "NULL"
  SQLite.query(DB,"INSERT INTO moves VALUES($move_number,
                                          \"move\",
                                          $sourcex,
                                          $sourcey,
                                          $targetx,
                                          $targety,
                                          \"$promote\",
                                          NULL,
                                          NULL,
                                          NULL)")
elseif length(ARGS) == 7
  targetx2 = ARGS[6]
  targety2 = ARGS[7]
  SQLite.query(DB,"INSERT INTO moves VALUES($move_number,
                                            \"move\",
                                            $sourcex,
                                            $sourcey,
                                            $targetx,
                                            $targety,
                                            NULL,
                                            NULL,
                                            $targetx2,
                                            $targety2)")

elseif length(ARGS) == 8
  promote = ARGS[6] == "T" ? "!" : "NULL"
  targetx2 = ARGS[7]
  targety2 = ARGS[8]
  SQLite.query(DB,"INSERT INTO moves VALUES($move_number,
                                          \"move\",
                                          $sourcex,
                                          $sourcey,
                                          $targetx,
                                          $targety,
                                          \"$promote\",
                                          NULL,
                                          $targetx2,
                                          $targety2)")
else
  exit(0)
end


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
