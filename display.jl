include("getboard.jl")
board,black_die,white_die = getCurrentBoard(ARGS[1])

x,y = size(board)
print("\n\n   ")
for i = 0 : x - 1
  print_with_color(:cyan,"   ",string('a' + i))
end
println()
for i = 1: 2*y + 1
  if i % 2 == 1
    print("    +")
  else
    if Int(i/2)<10
      print_with_color(:cyan," ",string(Int(i/2)))
      print("  |")
    else
      print_with_color(:cyan," ",string(Int(i/2)))
      print(" |")
    end

  end
  for j = 1:x
    if i % 2 == 1
      print("---+")
    else
      print(" ")
      if length(board[j,Int(i/2)]) < 2
        print(" ")
      else
        if board[j,Int(i/2)][2] == '0'
          print_with_color(board[j,Int(i/2)][1] == 'k'? :yellow : :bold,string(board[j,Int(i/2)][1]))
        else
          print_with_color(board[j,Int(i/2)][1] == 'k'? :yellow : :black,string(board[j,Int(i/2)][1]))
        end
      end
      print(" |")
    end
  end
  if i % 2 == 0
    print_with_color(:cyan," ",string(Int(i/2)))
  end
  println()
end
print("   ")
for i = 0 : x - 1
  print_with_color(:cyan,"   ",string('a' + i))
end


println("\nDrop Token")
println("Black_die: ",black_die)
println("White_die: ",white_die)
