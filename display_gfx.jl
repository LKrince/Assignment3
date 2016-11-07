using Tk
include("getboard.jl")
board,black_die,winhite_die=getCurrentBoard(ARGS[1])
board =  ["l0" "f0" "c0" "s0" "g0" "k0" "e0" "g0" "s0" "c0" "f0" "l0";
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
x,y=size(board)
win=Toplevel("Chu Shogi")
f=Frame(win)
white_die = []
black_die = []
a_w=" "
b_w=" "
for i in 1:length(white_die)
    a_w=a_w * white_die[i]" "
end
a_w="white_die : " *a_w
white_die_button = Button(win, a_w)

for i in 1:length(black_die)
    b_w=b_w * black_die[i]" "
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

a = 0
function callback(path)
  destroy(win)
  a = 10
end

pack(f,expand = true, fill="both")
pack(white_die_button, expand=true, fill="both")
pack(black_die_button, expand=true,fill="both")
exit=Button(win,"Click here to exit the window!!!!!!",callback)
pack(exit,expand=true,fill="both")
while(true)
  if a == 10
    return
  else
    sleep(1)
  end
end
