defmodule Responding do
  def print(parent_pid) do
    receive do
      message ->
        IO.puts(message)
        send(parent_pid, "I will print your message!")
    end
    print(parent_pid)
  end
end

parent_pid = self()
pid = spawn(fn -> Responding.print(parent_pid) end)

# pid = spawn(fn -> Responding.print(self()) end)

send(pid, "Hello")
send(pid, "World")

receive do
  message -> IO.puts(message)
end

receive do
  message -> IO.puts(message)
end
