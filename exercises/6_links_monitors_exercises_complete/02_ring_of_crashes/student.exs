defmodule LinkedProcess do
  def start(), do: spawn(&loop/0)
  def link(a, b), do: send(a, {:link, b})
  def crash(pid), do: Process.exit(pid, :kill)

  defp loop() do
    receive do
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

IO.puts("\nA alive: #{Process.alive?(a)}")
IO.puts("B alive: #{Process.alive?(b)}")
IO.puts("C alive: #{Process.alive?(c)}")
IO.puts("D alive: #{Process.alive?(d)}")

LinkedProcess.crash(b)

IO.puts("\nA alive: #{Process.alive?(a)}")
IO.puts("B alive: #{Process.alive?(b)}")
IO.puts("C alive: #{Process.alive?(c)}")
IO.puts("D alive: #{Process.alive?(d)}")
