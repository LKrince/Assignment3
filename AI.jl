module Tree
  using SQLite
  include("pieces.jl")
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
  global root
  global height = 0
  global game_type = NaN
  global side
  function init(move, board, game_type_in, side_in)
    global root=Node(move, [], board, NaN, [], 0)
    global game_type = game_type_in
    global side = side_in
  end
  function getMovesForRoot()
    b = root.board
    t = root.board.board_type
    temp = getAllMoves(b.board, t, side)
    for t in temp
      source = getsource(b.board, t, side)
      p = getPieceTaken(b.board, t, side)
      a = Move(t, [source[1] source[2]], p, side)
      push!(root.move, a)
    end
  end

  #expand the tree
  function expand(nd::Node, depth)
    if nd.move == [] || depth == 2
      return
    end
    #println("Expanding depth ", depth)
    if nd.children == []
      makeChildrenFromMoves(nd)
    end
    for child in nd.children
      expand(child, depth+1)
    end
  end
  #helper function of function expand, convert moves in the node to children list
  function makeChildrenFromMoves(nd::Node)
    if nd.move == []
      return []
    end
    s = side
    t = nd.board.board_type
    for m in nd.move
      current_move = m.current_move
      source = getsource(nd.board.board, current_move,s)
      b, p = makeMove(nd, m)
      current_move = m.current_move

      board_after_move = Board(b, t)
      x = source[1]
      y = source[2]
      moves_after_moves = getAllMoves(b, t, s)
      new_move = []
      for move in moves_after_moves
        source = getsource(b, move,s)
        temp_move = Move(move, [source[1] source[2]], "", s)
        push!(new_move, temp_move)
      end
      move_node = Move(current_move, [x, y], p, s)
      child = Node(move_node, new_move, board_after_move, nd, [], nd.depth+1)
      push!(nd.children, child)
    end
  end
  #helper function of function expand, make current move to get the next board for comparing
  function makeMove(nd, move)
    sourcex, sourcey = move.source[1], move.source[2]
    board_current = deepcopy(nd.board.board)
    board_type = nd.board.board_type
    m = move.current_move
    targetx = parse(m[3:length(m)-1])
    targety = Int(m[length(m)])-96
    pieceTaken = ""
    if m[2] == 'x'
      pieceTaken = board_current[targetx, targety]
    end
    board_current[targetx, targety] = string(m[1]) * string(side)
    board_current[sourcex, sourcey] = " "
    return board_current, pieceTaken
  end
  #helper function for function expand, get the source of the move
  function getsource(board, move,color)
    p = move[1]
    l = Int(sqrt(length(board)))
    for i = 1:l
      for j = 1:l
        if board[i, j] == string(p) * string(color)
          allmove = getAllMovesChar(board, "chu", i, j, color)
          std_move = toStandard(board, board[i,j][1], allmove, i, j)
          if move in std_move
            return i,j
          end
        end
      end
    end
  end
  function getPieceTaken(board, move,color)
    if move[2] == '-'
      return ""
    end
    targetx = parse(move[3:length(move)-1])
    targety = Int(move[length(move)])-96
    return lowercase(board[targetx, targety][1])
  end

  #select a node to move
  function selection(nd::Node)
    adv = getPointAdvantageOfSide(nd.board.board, nd.currentMove.side)
    max_adv = adv
    select = NaN
    for child in nd.children
      adv_child = getPointAdvantageOfSide(child.board.board, child.currentMove.side)
      if adv_child >= adv && adv_child >= max_adv
        max_adv = adv_child
        select = child
      end
    end
    select
  end
  #helper function for selection, get the total value of a sied of the current board
  function getPointValueOfSide(board, side)
    points = 0
    for i = 1:l
      for j = 1:l
        if board[i, j] != " " && board[i, j][2] == string(color)[2]
          v = getValue(i,j,color)
          points += v
        end
      end
    end
    return points
  end
  #helper function for selection, get value for a single piece
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
  #helper function for selection , get advantage point of the board
  function getPointAdvantageOfSide(board, side)
    self = getPointValueOfSide(board, side)
    opp = 0
    if side == 1
      opp = getPointValueOfSide(board, 0)
    else
      opp =getPointValueOfSide(board, 1)
    end
    return self - opp
  end

  #get standard moves
  function toStandard(board, piece::Char, moves, x::Int, y::Int)
    standard = []
    if moves == []
      return standard
    end
    l = convert(Int, sqrt(length(board)))
    for i = 1:2:length(moves)
      m_std = string(piece)
      move_x = moves[i]
      move_y = moves[i+1]
      target_x, target_y = x+move_x, y+move_y
      if (target_x > l || target_x < 1) || (target_y > l || target_y < 1)
        println("$piece, $target_x, $target_y")
        continue
      end
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
  #get all available and legal moves for the current baord
  function getAllMoves(board, board_type, side)
    l = Int(sqrt(length(board)))
    global moves = []
    for i = 1:l
      for j = 1:l
        if board[i,j] != " " && board[i,j][2] == string(side)[1]
          m = getAllMovesChar(board,board_type,i,j,side)
          p = board[i,j][1]
          if m == [] || m == nothing
            continue
          end
          m_std = toStandard(board,p,m,i,j)
          for k = 1:length(m_std)
            push!(moves, m_std[k])
          end
        end
      end
    end
    return moves
  end
  #get mvoes of a single piece of current board
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
        temp2 = chu.D.getcapture(board,x,y,color)
        for i in temp2
          push!(temp1, i)
        end
        return temp1
      elseif name == 'e'
        return chu.e.getmoves(board, x, y, color)
      elseif name == 'E'
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
        temp2 = chu.H.getcapture(board,x,y,color)
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

  #make a random move
  function makeRandomMove(filename)
    DB = SQLite.DB(filename)
    promotion = "NULL"
    if root.board.board_type == "chu"
      if side == 1
        promote_line = 4
      else
        promote_line = 8
      end
    elseif root.board.board_type == "minishogi"
      if side == 1
        promote_line = 1
      else
        promote_line = 5
      end
    else
      if side == 1
        promote_line = 3
      else
        promote_line = 7
      end
    end

    l = length(root.move)
    r = rand(1:l, 1, 1)
    m = root.move[r]
    b = root.board.board
    target = m[1].current_move
    temp = getsource(b, target, side)
    source = [temp[1] temp[2]]
    p = target[1]
    mvoe_num = SQLite.query(DB, "select count(*) from moves")[1].values[1]
    move_type = "move"
    targetx = parse(target[3:length(target)-1])
    targety = Int(target[length(target)])-96
    if side == 1
      if promote_line >= targetx
        promotion = "!"
      end
    else
      if promote_line <= targetx
        promotion = "!"
      end
    end
    targetx2 = targety2 = "NULL"

    move_num = SQLite.query(DB, "select count(*) from moves")[1].values[1]
    sql_move = "insert into moves(move_number,move_type, sourcex, sourcey, targetx, targety, option, i_am_cheating, targetx2, targety2)"
    sql_move *= " values ($(move_num+1),\""*move_type*"\", $(source[1]), $(source[2]), $(targetx), $(targety), " * promotion * ", NULL, $(targetx2), $(targety2))"
    SQLite.execute!(DB, sql_move)
  end

end
