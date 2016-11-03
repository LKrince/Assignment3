include("pieces.jl")
type Board
  global board = NaN
  global board_type = NaN
end
type Move
  global move::Array(Int64)
  global source::Array(Int64)
  global pieceTaken::Char
  global side::Int64
end
function undoMove()
  [lastMove pieceTaken x y side]= pop!(history)
  p = lastMove[1]
  targetx = parse(lastMove[3:length(a)-1])
  targety = Int(lastMove[length(lastMove)])-96
  sourcex = x
  sourcey = y
  board[sourcex,sourcey] = string(p)*string(side)
  if pieceTaken != ""
    board[targetx, targety] = pieceTaken
  else
    board[targetx, targety] = " "
  end
end
function makeMove(board, board_type,move,side)
  p = move[1]
  pieceTaken = ""
  [sourcex sourcey] = move.source
  targetx = parse(lastMove[3:length(a)-1])
  targety = Int(lastMove[length(lastMove)])-96
  if move[2] == 'x'
    pieceTaken = board[targetx, targety]
  end
  board[targetx, targety] = string(p) * string(side)
  board[sourcex, xourcey] = " "
  push!(history,[move pieceTaken sourcex sourcey side])
end

#get standard moves
function toStandard(piece::Char, moves, x::Int, y::Int)
  standard = []
  if moves == []
    return standard
  end
  for i = 1:2:length(moves)
    m_std = string(piece)
    move_x = moves[i]
    move_y = moves[i+1]
    target_x, target_y = x+move_x, y+move_y
    if board[target_x, target_y] != " "
      m_std*="x"
    else
      m_std*="-"
    end
    m_std = m_std * string(target_x)
    m_std = m_std * string(Char(96+target_y))
    push!(standard, m_std)
  end
  return standard
end
function getAllMoves(board, board_type, side)
  l = Int(sqrt(length(board)))
  global moves = []
  for i = 1:l
    for j = 1:l
      if board[i,j] != " " board[i,j][2] == string(side)[1]
        m = getAllMovesChar(board,board_type,i,j,side)
        p = board[i,j][1]
        m_std = toStandard(p,m,i,j)
        for k = 1:length(m_std)
          push!(moves, m_std[k])
        end
      end
    end
  end
  return moves
end
function getAllMovesChar(board, board_type, x,y,color)
  name=board[x,y][1]
  if board_type != "chu"
    if name == 'p'
      return SM.p.getmoves(board, x, y, color)
    elseif name == 'b'
      return SM.b.getmoves(board, x, y, color)
    elseif name == 'g'
      return SM.g.getmoves(board, x, y, color)
    elseif name == 'k'
      return SM.k.getmoves(board, x, y, color)
    elseif name == 'l'
      return SM.l.getmoves(board, x, y, color)
    elseif name == 'n'
      return SM.n.getmoves(board, x, y, color)
    elseif name == 'r'
      return SM.r.getmoves(board, x, y, color)
    elseif name == 's'
      return SM.s.getmoves(board, x, y, color)
    elseif name == 'p'
      return SM.P.getmoves(board, x, y, color)
    elseif name == 'B'
      return SM.B.getmoves(board, x, y, color)
    elseif name == 'L'
      return SM.L.getmoves(board, x, y, color)
    elseif name == 'N'
      return SM.N.getmoves(board, x, y, color)
    elseif name == 'R'
      return SM.R.getmoves(board, x, y, color)
    elseif name == 'S'
      return SM.S.getmoves(board, x, y, color)
    end
  else
    if name == 'a'
      return chu.a.getmoves(board, x, y, color)
    elseif name == 'A'
      return chu.A.getmoves(board, x, y, color)
    elseif name == 'b'
      return chu.b.getmoves(board, x, y, color)
    elseif name == 'B'
      return chu.B.getmoves(board, x, y, color)
    elseif name == 'c'
      return chu.c.getmoves(board, x, y, color)
    elseif name == 'C'
      return chu.C.getmoves(board, x, y, color)
    elseif name == 'd'
      return chu.d.getmoves(board, x, y, color)
    elseif name == 'D'
      temp1 = chu.D.getmoves(board, x, y, color)
      temp2 = chu.D.getjump(board,x,y,color)
      for i in temp2
        push!(temp1, i)
      end
      return temp1
    elseif name == 'e'
      return chu.E.getmoves(board, x, y, color)
    elseif name == 'f'
      return chu.f.getmoves(board, x, y, color)
    elseif name == 'F'
      return chu.F.getmoves(board, x, y, color)
    elseif name == 'g'
      return chu.g.getmoves(board, x, y, color)
    elseif name == 'G'
      return chu.G.getmoves(board, x, y, color)
    elseif name == 'h'
      return chu.h.getmoves(board, x, y, color)
    elseif name == 'H'
      temp1 = chu.H.getmoves(board, x, y, color)
      temp2 = chu.H.getjump(board,x,y,color)
      for i in temp2
        push!(temp1, i)
      end
      return temp1
    elseif name == 'i'
      temp1 = chu.i.getjump(board,x,y,color)
      temp2 = chu.i.getmoves(board, x, y, color)
      for i in temp2
        push!(temp1, i)
      end
      return temp1
    elseif name == 'k'
      return chu.k.getmoves(board, x, y, color)
    elseif name == 'l'
      return chu.l.getmoves(board, x, y, color)
    elseif name == 'L'
      return chu.L.getmoves(board, x, y, color)
    elseif name == 'm'
      return chu.m.getmoves(board, x, y, color)
    elseif name == 'M'
      return chu.M.getmoves(board, x, y, color)
    elseif name == 'n'
      return chu.n.getmoves(board, x, y, color)
    elseif name == 'N'
      return chu.N.getmoves(board, x, y, color)
    elseif name == 'o'
      return chu.o.getmoves(board, x, y, color)
    elseif name == 'O'
      return chu.O.getmoves(board, x, y, color)
    elseif name == 'p'
      return chu.p.getmoves(board, x, y, color)
    elseif name == 'P'
      return chu.P.getmoves(board, x, y, color)
    elseif name == 'r'
      return chu.r.getmoves(board, x, y, color)
    elseif name == 'R'
      return chu.R.getmoves(board, x, y, color)
    elseif name == 's'
      return chu.s.getmoves(board, x, y, color)
    elseif name == 'S'
      return chu.S.getmoves(board, x, y, color)
    elseif name == 't'
      return chu.t.getmoves(board, x, y, color)
    elseif name == 'T'
      return chu.T.getmoves(board, x, y, color)
    elseif name == 'q'
      return chu.q.getmoves(board, x, y, color)
    elseif name == 'v'
      return chu.v.getmoves(board, x, y, color)
    elseif name == 'V'
      return chu.V.getmoves(board, x, y, color)
    elseif name == 'x'
      return chu.x.getmoves(board, x, y, color)
    elseif name == 'X'
      return chu.X.getmoves(board, x, y, color)
    end
  end
end

function getsource(move,color)
  p = move[1]
  l = Int(sqrt(length(board)))
  for i = 1:l
    for j = 1:l
      if board[i, j][2] == string(color)[2]
        allmove = getAllMovesChar(i,j,color)
        if mvoe in allmove
          return i,j
        end
      end
    end
  end
end
function getPointValueOfSide(side)
  points = 0
  for i = 1:l
    for j = 1:l
      if board[i, j][2] == string(color)[2]
        v = getValue(i,j,color)
        points == v
      end
    end
  end
  return points
end
function getValue(x,y,color)
  name=board[x,y][1]
  if board_type != "chu"
    if name == 'p'
      return SM.p.value
    elseif name == 'b'
      return SM.b.value
    elseif name == 'g'
      return SM.g.value
    elseif name == 'k'
      return SM.k.value
    elseif name == 'l'
      return SM.l.value
    elseif name == 'n'
      return SM.n.value
    elseif name == 'r'
      return SM.r.value
    elseif name == 's'
      return SM.s.value
    elseif name == 'p'
      return SM.P.value
    elseif name == 'B'
      return SM.B.value
    elseif name == 'L'
      return SM.L.value
    elseif name == 'N'
      return SM.N.value
    elseif name == 'R'
      return SM.R.value
    elseif name == 'S'
      return SM.S.value
    end
  else
    if name == 'a'
      return chu.a.value
    elseif name == 'A'
      return chu.A.value
    elseif name == 'b'
      return chu.b.value
    elseif name == 'B'
      return chu.B.value
    elseif name == 'c'
      return chu.c.value
    elseif name == 'C'
      return chu.C.value
    elseif name == 'd'
      return chu.d.value
    elseif name == 'D'
      return chu.D.value
    elseif name == 'e'
      return chu.E.value
    elseif name == 'f'
      return chu.f.value
    elseif name == 'F'
      return chu.F.value
    elseif name == 'g'
      return chu.g.value
    elseif name == 'G'
      return chu.G.value
    elseif name == 'h'
      return chu.h.value
    elseif name == 'H'
      return chu.H.value
    elseif name == 'i'
      return chu.i.value
    elseif name == 'k'
      return chu.k.value
    elseif name == 'l'
      return chu.l.value
    elseif name == 'L'
      return chu.L.value
    elseif name == 'm'
      return chu.m.value
    elseif name == 'M'
      return chu.M.value
    elseif name == 'n'
      return chu.n.value
    elseif name == 'N'
      return chu.N.value
    elseif name == 'o'
      return chu.o.value
    elseif name == 'O'
      return chu.O.value
    elseif name == 'p'
      return chu.p.value
    elseif name == 'P'
      return chu.P.value
    elseif name == 'r'
      return chu.r.value
    elseif name == 'R'
      return chu.R.value
    elseif name == 's'
      return chu.s.value
    elseif name == 'S'
      return chu.S.value
    elseif name == 't'
      return chu.t.value
    elseif name == 'T'
      return chu.T.value
    elseif name == 'q'
      return chu.q.value
    elseif name == 'v'
      return chu.v.value
    elseif name == 'V'
      return chu.V.value
    elseif name == 'x'
      return chu.x.value
    elseif name == 'X'
      return chu.X.value
    end
  end
end
function getPointAdvantageOfSide(side)
end


module Move
  notation = NaN
  check = false
  checkmate = false
  promotion = false
  stalemate = false

  piece = NaN
  oldPos = NaN
  newPos = NaN
  pieceToCapture = NaN

  function __init(piece_in, newPos_in, pieceToCapture_in = NaN)
    global piece = piece
    global oldPos = piece.oldPos
    global newPos = newPos_in
    global pieceToCapture = pieceToCapture_in
  end
  function eq(other)
    if oldPos == other.oldPos && newPos == other.newPos
      return false
    else
      return true
    end
  end
end
