include("AI.jl")
include("getboard.jl")
using SQLite
time_start = time()
filename = ARGS[1]
board,WHILT_KILL, BLACK_KILL = getCurrentBoard(filename)
DB = SQLite.DB(filename)

mode = SQLite.query(DB, "select * from meta where key == \"type\"")
game_type = "chu"

move_num = SQLite.query(DB, "select count(*) from moves")[1].values[1]

if move_num%2 == 1
  color = 0
else
  color = 1
end
move = Tree.Move("", [NaN NaN], "", 1)
b = Tree.Board(board, game_type)
Tree.init(move, b, game_type, color)
Tree.getMovesForRoot()
Tree.makeChildrenFromMoves(Tree.root)
Tree.expand(Tree.root, 0)
Tree.makeRandomMove(DB)
println("Done")

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
