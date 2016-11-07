#start listenning
port = parse(ARGS[1])
sv = listen(port)
println("Starting listenning on port $port")
global p1 = nothing
global p2 = nothing
#subroutine for accepting connections
while true
  if p1 == nothing || p2 == nothing
    if p1 == nothing
      global p1 = accept(sv)
      @async begin
        println(STDOUT,"Play_1 online")
        try
          while true
            println(STDOUT,p1)
            line = readline(p1)
            println(STDOUT,"player_1 said : $line")
            println(p1,"You(p1) said : $line")
          end
        catch err
          println("connection ended with error $err")
        end
      end
    elseif p2 == nothing
      println(STDOUT,"Play_2 online")
      global p2 = accept(sv)
      @async begin
        println(STDOUT,"Play_2 online")
        try
          while true
            line = readline(p2)
            println(STDOUT,"player_2 said : $line")
            println(p1,"You(p2) said : $line")
          end
        catch err
          println("connection ended with error $err")
        end
      end
    end
  end
end




function splitor(str)
  str = chomp(str)
  info_arr = split(str,':')
  return info_arr,length(info_arr)
end

function authGenerator()
  #generate authString seeds.
  auth = ""
  authString_pairs = []
  for i = 97:122
    push!(authString_pairs,string(Char(i)))
    push!(authString_pairs,string(Char(i - 32)))
  end
  for i = 1:9
    push!(authString_pairs,string(i))
  end
  length = rand(8:64,1)[1]
  info(length)
  for i = 1:length
    auth *= rand(authString_pairs,1)[1]
  end
  return auth
end
