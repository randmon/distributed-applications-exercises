defmodule Counter do
  def counter(current\\0) do
    receive do
      {:inc, pid} ->
        new_current = current + 1
        send(pid, new_current)
        counter(new_current)
      {:dec, pid} ->
        new_current = current - 1
        send(pid, new_current)
        counter(new_current)
      {:get, pid} ->
        send(pid, current)
        counter(current)
      {:reset, pid} ->
        send(pid, 0)
        counter()
    end
  end
end


sender_pid = self()
pid = spawn(fn -> Counter.counter() end)

send(pid, {:inc, sender_pid})
receive do
  answer -> IO.puts(answer)
end

send(pid, {:inc, sender_pid})
receive do
  answer -> IO.puts(answer)
end

send(pid, {:dec, sender_pid})
receive do
  answer -> IO.puts(answer)
end

send(pid, {:inc, sender_pid})
receive do
  answer -> IO.puts(answer)
end

send(pid, {:get, sender_pid})
receive do
  answer -> IO.puts(answer)
end

send(pid, {:reset, sender_pid})
receive do
  answer -> IO.puts(answer)
end
