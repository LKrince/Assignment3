module SM
  module k
    allMove = [1 1 1 0 1 -1 0 1 0 -1 -1 -1 -1 0 -1 1]
    name = "k"
    value = 100
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module r
    allMove = [1 0 -1 0 0 1 0 -1]
    name = "r"
    value = 9
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end

  module R
    allMove = [1 0 -1 0 0 1 0 -1 1 1 1 -1 -1 1 -1 -1]
    name = "R"
    value = 13
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:8
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 9:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module b
    allMove = [1 1 1 -1 -1 1 -1 -1]
    name = "b"
    value = 8
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end

  module B
    allMove = [1 1 1 -1 -1 1 -1 -1 0 1 0 -1 1 0 -1 0]
    name = "B"
    value = 12
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:8
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 9:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module g
    allmove_w = [1 0 -1 0 0 1 0 -1 1 1 1 -1]
    allmove_b = [-1 0 -1 -1 -1 1 0 1 0 -1 1 0]
    name = "g"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module s
    allmove_w = [1 1 1 0 1 -1 -1 -1 -1 1]
    allmove_b = [-1 0 -1 -1 -1 1 1 -1 1 1]
    name = "s"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module S
    allmove_w = [1 0 -1 0 0 1 0 -1 1 1 1 -1]
    allmove_b = [-1 0 -1 -1 -1 1 0 1 0 -1 1 0]
    name = "S"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module n
    allmove_w = [2 -1 2 1]
    allmove_b = [-2 1 -2 -1]
    name = "n"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module N
    allmove_w = [1 0 -1 0 0 1 0 -1 1 1 1 -1]
    allmove_b = [-1 0 -1 -1 -1 1 0 1 0 -1 1 0]
    name = "N"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module l
    allmove_w = [1 0]
    allmove_b = [-1 0]
    name = "l"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module L
    allmove_w = [1 0 -1 0 0 1 0 -1 1 1 1 -1]
    allmove_b = [-1 0 -1 -1 -1 1 0 1 0 -1 1 0]
    name = "L"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  module p
    allmove_w = [1 0]
    allmove_b = [-1 0]
    name = "p"
    value = 1
    function getmoves(board, x, y, color)
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      target_x= x+allMove[1]
      if board[target_x, y] == " "
        push!(valid, allMove[1])
        push!(valid, 0)
      elseif board[target_x, y][2] == string(color_opp)[1]
        push!(valid, allMove[1])
        push!(valid, 0)
      end
      return valid
    end
  end

  module P
    allmove_w = [1 0 -1 0 0 1 0 -1 1 1 1 -1]
    allmove_b = [-1 0 -1 -1 -1 1 0 1 0 -1 1 0]
    name = "P"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
end

module chu
  #go between
  module o
    allMove = [1 0 -1 0]
    name = "o"
    value = 1
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        
      else
        color_opp = 1

      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted go between, drunk elephant
  module O
    allmove_b = [-1 -1 -1 0 -1 1 0 1 0 -1 1 1 1 -1]
    allmove_w = [1 1 1 0 1 -1 0 1 0 -1 -1 -1 -1 1]
    name = "O"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #king
  module k
    allMove = [1 1 1 0 1 -1 0 1 0 -1 -1 -1 -1 0 -1 1]
    name = "k"
    value = 4
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #rook
  module r
    allMove = [1 0 -1 0 0 1 0 -1]
    name = "r"
    value = 6
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end
  #promoted rook, dragon king
  module R
    allMove = [1 0 -1 0 0 1 0 -1 1 1 1 -1 -1 1 -1 -1]
    name = "R"
    value = 8
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:8
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 9:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #bishop
  module b
    allMove = [1 1 1 -1 -1 1 -1 -1]
    name = "b"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end
  #promoted bishop, dragon horse
  module B
    allMove = [1 1 1 -1 -1 1 -1 -1 0 1 0 -1 1 0 -1 0]
    name = "B"
    value = 7
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:8
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 9:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #pawn
  module p
    allmove_w = [1 0]
    allmove_b = [-1 0]
    name = "p"
    value = 1
    function getmoves(board, x, y, color)
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      target_x= x+allMove[1]
      if board[target_x, y] == " "
        push!(valid, allMove[1])
        push!(valid, 0)
      elseif board[target_x, y][2] == string(color_opp)[1]
        push!(valid, allMove[1])
        push!(valid, 0)
      end
      return valid
    end
  end
  #promoted pawn, gold general
  module P
    allmove_w = [1 0 -1 0 0 1 0 -1 1 1 1 -1]
    allmove_b = [-1 0 -1 -1 -1 1 0 1 0 -1 1 0]
    name = "P"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #gold general
  module g
    allmove_w = [1 0 -1 0 0 1 0 -1 1 1 1 -1]
    allmove_b = [-1 0 -1 -1 -1 1 0 1 0 -1 1 0]
    name = "g"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted gold general, rook
  module G
    allMove = [1 0 -1 0 0 1 0 -1]
    name = "G"
    value = 6
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end

  #reverse chariot
  module a
    allMove = [1 0 -1 0]
    name = "a"
    value = 6
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end
  #promoted reverse chariot, whale
  module A
    allmove_w = [1 0 -1 0 -1 -1 -1 1]
    allmove_b = [1 0 -1 0 1 -1 1 1]
    name = "A"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end

  #copper general
  module c
    allmove_w = [1 1 1 0 1 -1 -1 0]
    allmove_b = [-1 -1 -1 0 -1 1 1 0]
    name = "c"
    value = 2
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted copper general, side mover
  module C
    allMove = [0 1 0 -1 1 0 -1 0]
    name = "C"
    value = 4
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:4
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 5:2:8
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #dragon king
  module d
    allMove = [1 0 -1 0 0 1 0 -1 1 1 1 -1 -1 1 -1 -1]
    name = "d"
    value = 8
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:8
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 9:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted dragon king, soaring eagle
  module D
    allmove_w = [1 0 -1 0 0 1 0 -1 -1 -1 -1 1 2 -2 2 2]
    allmove_b = [-1 0 1 0 0 1 0 -1 1 -1 1 1 -2 -2 -2 2]
    capture_w = [1 -1 1 1]
    capture_b = [-1 -1 -1 1]
    name = "D"
    value = 11
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        allMove = allmove_b
        color_opp = 0
      else
        allMove = allmove_w
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:12
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 13:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
    function getcapture(board, x, y, color)
      if color == 1
        capture = capture_b
        color_opp = 0
      else
        capture = capture_w
        color_opp= 1
      end
      valid =[]
      for i = 1:2:length(capture)
        target_x, target_y = x+capture[i], y+capture[i+1]
        if board[target_x, target_y] != " " && board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, i)
          push!(valid, i+1)
        end
      end
      return valid
    end
  end

  #drunk elephant
  module e
    allmove_b = [-1 -1 -1 0 -1 1 0 1 0 -1 1 1 1 -1]
    allmove_w = [1 1 1 0 1 -1 0 1 0 -1 -1 -1 -1 1]
    name = "e"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted drunk elephant, prince
  module E
    allMove = [1 1 1 0 1 -1 0 1 0 -1 -1 -1 -1 0 -1 1]
    name = "k"
    value = 4
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #ferocious leopard
  module f
    allMove = [1 0 1 1 1 -1 -1 0 -1 1 -1 -1]
    name = "f"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted fercious leopard, bishop
  module F
    allMove = [1 1 1 -1 -1 1 -1 -1]
    name = "F"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end

  #dragon horse
  module h
    allMove = [1 1 1 -1 -1 1 -1 -1 0 1 0 -1 1 0 -1 0]
    name = "B"
    value = 7
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:8
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 9:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted dragon horse. horned falcon
  module H
    allmove_w = [1 1 1 -1 0 1 0 -1 -1 1 -1 0 -1 -1 2 0 ]
    allmove_b = [-1 -1 -1 1 0 1 0 -1 1 1 1 -1 1 0 -2 0]
    capture_w = [1 0]
    capture_b = [-1 0]
    name = "H"
    value = 10
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        allMove = allmove_b
        color_opp = 0
      else
        allMove = allmove_w
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:14
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 15:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
    function getcapture(board, x, y, color)
      if color == 1
        capture = capture_b
        color_opp = 0
      else
        capture = capture_w
        color_opp= 1
      end
      valid =[]
      for i = 1:2:length(capture)
        target_x, target_y = x+capture[i], y+capture[i+1]
        if board[target_x, target_y] != " " && board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, i)
          push!(valid, i+1)
        end
      end
      return valid
    end
  end

  #lion
  module i
    jump = [2 0 2 -1 2 -2 2 1 2 2 1 -2 1 2 0 2 0 -2 -1 2 -1 -2 -2 -2 -2 -1 -2 0 -2 1 -2 2]
    move = [1 -1 1 0 1 1 0 1 0 -1 -1 -1 -1 0 -1 1]
    name = "i"
    value = 20
    function getjump(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:16
        move_x, move_y = jump[i], jump[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:16
        move_x, move_y = move[i], move[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #lance
  module l
    allmove_w = [1 0]
    allmove_b = [-1 0]
    name = "l"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted lance, white horse
  module L
    allmove_w = [1 0 1 -1 1 1 -1 0]
    allmove_b = [-1 -1 -1 0 -1 1 1 0]
    name = "L"
    value = 7
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end

  #side mover
  module m
    allMove = [0 1 0 -1 1 0 -1 0]
    name = "C"
    value = 4
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:4
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 5:2:8
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted side mover, free boar
  module M
    allMove = [1 1 1 -1 -1 1 -1 -1 0 1 0 -1]
    name = "M"
    value = 8
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end

  #kirin
  module n
    allMove = [1 1 1 -1 -1 1 -1 -1 2 0 -2 0 0 2 0 -2]
    name = "n"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted kirin, lion
  module N
    jump = [2 0 2 -1 2 -2 2 1 2 2 1 -2 1 2 0 2 0 -2 -1 2 -1 -2 -2 -2 -2 -1 -2 0 -2 1 -2 2]
    move = [1 -1 1 0 1 1 0 1 0 -1 -1 -1 -1 0 -1 1]
    name = "i"
    value = 20
    function getjump(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:16
        move_x, move_y = jump[i], jump[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:16
        move_x, move_y = move[i], move[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #silver general
  module s
    allmove_w = [1 1 1 0 1 -1 -1 -1 -1 1]
    allmove_b = [-1 0 -1 -1 -1 1 1 -1 1 1]
    name = "s"
    value = 2
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted silver general, vertical mover
  module S
    allMove = [1 0 -1 0 0 1 0 -1 ]
    name = "S"
    value = 4
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:4
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 5:2:8
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #blind tiger
  module t
    allmove_w = [1 1 1 -1 0 1 0 -1 -1 -1 -1 0 -1 1]
    allmove_b = [-1 -1 -1 1 0 1 0 -1 1 1 1 0 1 -1]
    name = "t"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
        allMove = allmove_b
      else
        color_opp = 1
        allMove = allmove_w
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted blind tiger， flying stag
  module T
    allMove = [1 0 -1 0 0 1 0 -1 1 1 1 -1 -1 1 -1 -1]
    name = "R"
    value = 8
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:4
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 5:2:16
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end

  #queen
  module q
    allMove = [1 1 1 -1 -1 1 -1 -1 1 0 -1 0 0 1 0 -1]
    name = "b"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end

  #vertical moer
  module v
    allMove = [1 0 -1 0 0 1 0 -1 ]
    name = "v"
    value = 4
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:4
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      for i = 5:2:8
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
          break
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted vertical mover, flying ox
  module V
    allMove = [1 1 1 -1 -1 1 -1 -1 1 0 -1 0]
    name = "V"
    value = 8
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end

  #phoenix
  module x
    allMove = [1 0 -1 0 0 1 0 -1 2 2 -2 2 2 -2 -2 -2]
    name = "x"
    value = 3
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for i = 1:2:length(allMove)
        move_x, move_y = allMove[i], allMove[i+1]
        target_x, target_y = current_x + move_x, current_y + move_y
        if !((1<= target_x <=l) && (1<=target_y<=l))
          continue
        elseif board[target_x, target_y] == " "
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color_opp)[1]
          push!(valid, move_x)
          push!(valid, move_y)
        elseif board[target_x, target_y][2] == string(color)[1]
          continue
        end
      end
      return valid
    end
  end
  #promoted phoenix, queen
  module x
    allMove = [1 1 1 -1 -1 1 -1 -1 1 0 -1 0 0 1 0 -1]
    name = "X"
    value = 5
    function getmoves(board, x, y, color)
      current_x, current_y = x, y
      if color == 1
        color_opp = 0
      else
        color_opp = 1
      end
      l = convert(Int, sqrt(length(board)))
      valid = []
      for j = 1:2:length(allMove)
        dir = 1
        move_x, move_y = allMove[j], allMove[j+1]
        target_x = current_x+move_x*dir
        target_y = current_y+move_y*dir
        while (1<= target_x <=l) && (1<=target_y<=l)
          if board[target_x, target_y] == " "
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
          elseif board[target_x, target_y][2] == string(color_opp)[1]
            push!(valid, move_x*dir)
            push!(valid, move_y*dir)
            break
          elseif board[target_x, target_y][2] == string(color)[1]
            break
          end
          dir += 1
          target_x = current_x+move_x*dir
          target_y = current_y+move_y*dir
        end
      end
      return valid
    end
  end
end
