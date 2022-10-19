defmodule SendReceive do
  def print() do
    receive do
      message -> IO.puts(message)
    end
  end
end

pid = spawn(&SendReceive.print/0)
send(pid, "Hello World!")
send(pid, "22222") # wordt niet ontvangen
:timer.sleep(1000)
