defmodule Employee do
  use GenServer

  def start_link(name: n) do
    GenServer.start_link(__MODULE__, 0, name: n)
  end

  def inint(work) do
    {:ok, %{work: 0}, {:continue, :start}}
  end

  def add_work(emp, amount) do
    GenServer.cast(emp, {:addwork, amount})
  end

end
