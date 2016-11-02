using SQLite
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
