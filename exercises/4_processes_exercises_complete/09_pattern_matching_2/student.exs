defmodule Counter do
  def counter(current\\0) do
    receive do
      :inc ->
        counter(current + 1)
      :dec ->
        counter(current - 1)
      :reset ->
        counter(0)
      {:get, from} ->
        send(from, current)
        counter(current)
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
