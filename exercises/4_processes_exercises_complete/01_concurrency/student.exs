defmodule Concurrency do
  def repeat(n, f) do
    Enum.each(1..n, fn _ -> f.() end)
  end

  def say_n_times(n, message) do
    repeat(n, fn ->
      :timer.sleep(100)
      IO.puts(message)
    end)
  end
end

spawn( fn -> Concurrency.say_n_times(10, "foo") end )
spawn( fn -> Concurrency.say_n_times(10, "bar") end )
:timer.sleep(1000)


# Concurrency.say_n_times(5, "foo")
