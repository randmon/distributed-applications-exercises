defmodule Counter do
  defp counter(current \\ 0) do
    receive do
      :inc ->
        counter(current + 1)
      :dec ->
        counter(current - 1)
      :reset ->
        counter(0)
      {:get, sender_pid} ->
        send(sender_pid, current)
        counter(current)
    end
  end

  def start() do
    spawn(&counter/0)
  end

  def inc(pid) do
    send(pid, :inc)
  end

  def dec(pid) do
    send(pid, :dec)
  end

  def reset(pid) do
    send(pid, :reset)
  end

  def get(pid) do
    send(pid, {:get, self()})
    receive do
      answer -> answer
    end
  end
end

counter = Counter.start()

Counter.inc(counter)
Counter.inc(counter)
Counter.inc(counter)
IO.puts(Counter.get(counter))

Counter.dec(counter)
IO.puts(Counter.get(counter))

Counter.reset(counter)
IO.puts(Counter.get(counter))
