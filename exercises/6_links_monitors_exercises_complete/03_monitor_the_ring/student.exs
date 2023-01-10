defmodule LinkedProcess do
  def start(), do: spawn(&loop/0)
  def link(a, b), do: send(a, {:link, b})
  def crash(pid), do: send(pid, :crash)

  defp loop() do
    receive do
      :crash -> raise "Oh no, I have crashed!"
      {:link, pid} -> Process.link(pid)
    end
    loop()
  end
end

a = LinkedProcess.start()
b = LinkedProcess.start()
c = LinkedProcess.start()
d = LinkedProcess.start()

LinkedProcess.link(a, b)
LinkedProcess.link(b, c)
LinkedProcess.link(c, d)
LinkedProcess.link(d, a)

Process.monitor(a)
Process.monitor(b)
Process.monitor(c)
Process.monitor(d)

LinkedProcess.crash(a)

receive do msg -> IO.puts("\n #{inspect msg}") end
receive do msg -> IO.puts("\n #{inspect msg}") end
receive do msg -> IO.puts("\n #{inspect msg}") end
receive do msg -> IO.puts("\n #{inspect msg}") end
