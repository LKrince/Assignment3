board= ["l0" "f0" "c0" "s0" "g0" "k0" "e0" "g0" "s0" "c0" "f0" "l0";
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
move = Tree.Move("", [NaN NaN], "", 1)
b = Tree.Board(board, "chu")

Tree.init(move, b, "chu", 1)
Tree.getMovesForRoot()
Tree.makeChildrenFromMoves(Tree.root)
Tree.expand(Tree.root, 0)
println("Done!!!!")
#=
type Board
  board
  board_type
end
type Move
  current_move
  source
  pieceTaken
  side::Int
end
type Node
  currentMove
  move
  board
  parent
  children
  depth
end
=#
