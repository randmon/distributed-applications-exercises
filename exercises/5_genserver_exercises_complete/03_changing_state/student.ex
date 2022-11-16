defmodule BuildingManager do
  use GenServer

  def start(args) do
    GenServer.start(__MODULE__, args, name: __MODULE__)
  end

  def init(_args) do
    initial_state = %{rooms: []}
    {:ok, initial_state}
  end

  def list_rooms() do
    GenServer.call(__MODULE__, :list_rooms)
  end

  def handle_call(:list_rooms, from, state) do
    IO.puts("Hello, I am #{inspect(self())} and I've gotten a call from #{inspect(from)}")
    {:reply, state.rooms, state}
  end
end
