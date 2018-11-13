require 'socket'

server = TCPServer.new(2345)

loop do

  Thread.start(server.accept) do |socket|
    while socket
      socket.puts "What do you say?"

      input = socket.gets.chomp

      socket.puts "You said: #{input}. Goodbye!"
      if input == "quit"
        socket.close
        break
      else
        socket.flush
      end
    end

  end

end
