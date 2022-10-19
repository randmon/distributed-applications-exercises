defmodule Exercise do
  def magic_eight_ball(parent_pid) do
    receive do
      message ->
        IO.puts(message)
        # remainder of the length of the message divided by 3
        rem = rem(String.length(message), 3)
        case rem do
          0 -> send(parent_pid, :yes)
          1 -> send(parent_pid, :no)
          2 -> send(parent_pid, :maybe)
        end
    end

    magic_eight_ball(parent_pid)
  end
end

parent_pid = self()
pid = spawn(fn -> Exercise.magic_eight_ball(parent_pid) end)

send(pid, "Will I pass the exam?")
send(pid, "Is the exam easy?")
send(pid, "Is Elixir a fun language?")
send(pid, "Will I get a job after the exam?")

receive do
  message -> IO.puts(message)
end

receive do
  message -> IO.puts(message)
end

receive do
  message -> IO.puts(message)
end

receive do
  message -> IO.puts(message)
end
