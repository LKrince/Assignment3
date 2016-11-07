server = listen(8090)
global num = 1
while true
  info(num)
  conn = accept(server)
  @async begin
    try
      while true
        info("player online")
        line = readline(conn)
        println("$num : talking")
        println(conn,"$num said")
      end
    catch err
      println("connection ended with error $err")
    end
  end
  global num += 1
end
