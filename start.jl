using SQLite

#get global parameter
if(length(ARGS) >= 2)
    if(uppercase(ARGS[2]) == "S")
      Gametype = "standard"
    elseif (uppercase(ARGS[2])== "M")
      Gametype = "minishogi"
    elseif (uppercase(ARGS[2]) == "C")
      Gametype = "chu"
    else
      Gametype ="unset"
    end
else
  Gametype ="unset"
end

if(length(ARGS) >= 3)
  if(uppercase(ARGS[3]) == "T")
    Cheating = "cheating"
  else
    Cheating = "legal"
  end
else
  Cheating = "legal"
end

limit = 0
limit_add = 0
if(length(ARGS) == 4)
    if(uppercase(ARGS[4])!= "T")
      limit = parse(ARGS[3])
      limit_add = parse(ARGS[4])
    end

end
if(length(ARGS) == 5)
  limit = parse(ARGS[4])
  limit_add = parse(ARGS[5])
end


#set data base and initialize
#create data base
DB = SQLite.DB(ARGS[1])
#set table - "meta"
create_table_meta = "create table meta(key TEXT,value TEXT)"
SQLite.execute!(DB,create_table_meta)
#initialize table - "meta"
if (Gametype == "standard")
  insert_query ="insert into meta values(\"type\",\"standard\");"
  SQLite.execute!(DB,insert_query)
elseif (Gametype == "minishogi")
  insert_query ="insert into meta values(\"type\",\"minishogi\");"
  SQLite.execute!(DB,insert_query)
elseif (Gametype == "chu")
  insert_query ="insert into meta values(\"type\",\"chu\");"
  SQLite.execute!(DB,insert_query)
else
  println("undecided game type, can not start")
  exit()
end
#ligality
if (Cheating == "cheating")
  insert_query ="insert into meta values(\"legality\",\"cheating\");"
  SQLite.execute!(DB,insert_query)
else
  insert_query ="insert into meta values(\"legality\",\"legal\");"
  SQLite.execute!(DB,insert_query)
end
#limit
if (limit != 0)
  insert_query ="insert into meta values(\"timed\",\"yes\");"
  SQLite.execute!(DB,insert_query)

  insert_query ="insert into meta values(\"time_add\",\"$limit_add\");"
  SQLite.execute!(DB,insert_query)

  insert_query ="insert into meta values(\"sente_time\",\"$limit\")"
  SQLite.execute!(DB,insert_query)

  insert_query ="insert into meta values(\"gote_time\",\"$limit\")"
  SQLite.execute!(DB,insert_query)
else
  insert_query ="insert into meta values(\"timed\",\"no\");"
  SQLite.execute!(DB,insert_query)

end
#seed
unix_time = time()
insert_query =" insert into meta values(\"seed\",\"$unix_time\");"
SQLite.execute!(DB,insert_query)


#set table - "moves"
create_table_moves ="create table moves(move_number INTEGER,move_type TEXT,
                                        sourcex INTEGER, sourcey INTEGER,
                                        targetx INTEGER, targety INTEGER,
                                        option TEXT, i_am_cheating INTEGER,
                                        targetx2 INTEGER, targety2 INTEGER)"
SQLite.execute!(DB,create_table_moves)
