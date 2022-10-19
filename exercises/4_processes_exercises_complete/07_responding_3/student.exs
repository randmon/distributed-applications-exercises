defmodule Counter do
  def counter(current\\0) do
    receive do
      sender_pid -> send(sender_pid, current)
    end

    counter(current+1)
  end
end


sender_pid = self()
pid = spawn(fn -> Counter.counter() end)

send(pid, sender_pid)
receive do
  answer -> IO.puts(answer)
end

send(pid, sender_pid)
receive do
  answer -> IO.puts(answer)
end

send(pid, sender_pid)
receive do
  answer -> IO.puts(answer)
end

send(pid, sender_pid)
receive do
  answer -> IO.puts(answer)
end
