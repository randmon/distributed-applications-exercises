defmodule StayinAlive do
  def print() do
    receive do
      message -> IO.puts(message)
      print()
    end
  end
end

pid = spawn(&StayinAlive.print/0)
send(pid, "Hello World!")
send(pid, "22222") # wordt wel ontvangen
:timer.sleep(1000)
