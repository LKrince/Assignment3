using Tk
include("getboard.jl")
board,black_die,white_die=getCurrentBoard(ARGS[1])
x,y=size(board)
win=Toplevel("Chu Shogi")
f=Frame(win)
a_w=" "
b_w=" "
for i in 1:length(white_die)
    a_w=a_w * white_die[i][1:1]" "
end
a_w="white_die : " *a_w
white_die_button = Button(win, a_w)

for i in 1:length(black_die)
    b_w=b_w * black_die[i][1:1]" "
end
b_w="black_die : " *b_w
black_die_button = Button(win, b_w)


tcl("ttk::style", "configure","TLabel", background="black",frontgrount="black",font="helvetica 13")
tcl("pack", "propagate", win, true)
tcl("ttk::style", "configure","TButton", background="Blue",font="helvetica 12")

for i=1:x
  for j=1:y
    if length(board[i,j])<2
      fname = ("./resource/empty.gif")
      img=Image(fname)
      a=Label(f,img)
      grid(a, j, i)
    else
      check=board[i,j][2]
      temp=board[i,j][1]
      if temp=='A'
          fname = ("./resource/whale$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='B'
          fname = ("./resource/horse$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='C'
          fname = ("./resource/side$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='D'
          fname = ("./resource/eagle$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='E'
          fname = ("./resource/prince$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='F'
          fname = ("./resource/bishop$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='G'
          fname = ("./resource/rook$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='H'
          fname = ("./resource/falcon$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='L'
          fname = ("./resource/white_horse$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='M'
          fname = ("./resource/boar$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='N'
          fname = ("./resource/lion$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='O'
          fname = ("./resource/elephant$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='P'
          fname = ("./resource/gold$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='R'
          fname = ("./resource/dragon$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='S'
          fname = ("./resource/vertical$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='T'
          fname = ("./resource/stag$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='V'
          fname = ("./resource/ox$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='X'
          fname = ("./resource/queen$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='a'
          fname = ("./resource/chariot$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='b'
          fname = ("./resource/bishop$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='c'
          fname = ("./resource/copper$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='d'
          fname = ("./resource/dragon$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='e'
          fname = ("./resource/elephant$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='f'
          fname = ("./resource/leopard$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='g'
          fname = ("./resource/gold$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='h'
          fname = ("./resource/horse$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='i'
          fname = ("./resource/lion$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='k'
          fname = ("./resource/king$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='l'
          fname = ("./resource/lance$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='m'
          fname = ("./resource/side$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='n'
        if x==12
          fname = ("./resource/kirin$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
        else
          fname = ("./resource/knight$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
        end
      elseif temp=='o'
          fname = ("./resource/go_between$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='p'
          fname = ("./resource/pawn$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='r'
          fname = ("./resource/rook$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='s'
          fname = ("./resource/silver$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='t'
          fname = ("./resource/tiger$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='q'
          fname = ("./resource/queen$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='v'
          fname = ("./resource/vertical$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      elseif temp=='x'
          fname = ("./resource/phoenix$check.gif")
          img=Image(fname)
          a=Label(f,img)
          grid(a, j, i)
      end
    end
  end
end



pack(f,expand = true, fill="both")
pack(white_die_button, expand=true, fill="both")
pack(black_die_button, expand=true,fill="both")
for i=1:5
  quit=Button(win,"Window will close automatically in $i s",path->destroy(win))

  sleep(1)
end
  pack(quit,expand=true,fill="both")
