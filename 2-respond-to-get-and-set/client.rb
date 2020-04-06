require 'socket'

class BasicClient

  COMMANDS = [
    "GET",
    "SET",
  ]

  def two_full_gets(key)
    t0 = Time.now
    get(key)
    get(key)
    puts "Time elapsed: #{ (Time.now - t0)*1000 }ms"
  end

  def get(key)
    t0 = Time.now
    socket = TCPSocket.new 'localhost', 2000
    result = nil
    socket.puts "GET #{ key }"
    result = socket.gets
    socket.close
    puts "Time elapsed: #{ (Time.now - t0)*1000 }ms"
    result
  end

  def get2(key)
    get(key)
    get(key)
  end

  def get3(key)
    t0 = Time.now
    socket = TCPSocket.new 'localhost', 2000
    result = nil
    socket.puts "GET #{ key }"
    socket.puts "GET #{ key }"
    result = socket.gets
    socket.close
    puts "Time elapsed: #{ (Time.now - t0)*1000 }ms"
    result
  end

  def set(key, value)
    socket = TCPSocket.new 'localhost', 2000
    result = nil
    socket.puts "SET #{ key } #{ value }"
    result = socket.gets
    socket.close
    result
  end
end
