defmodule BuildingManager do
  use GenServer

  def start(_args) do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def init(_args) do
    initial_state = %{rooms: []}
    {:ok, initial_state}
  end

  def list_rooms_manual_implementation() do
    send(__MODULE__, {:list_rooms, self()})
    receive do
      {:rooms, rooms} -> rooms
    end
  end

  def handle_info({:list_rooms, caller}, state) do
    send(caller, {:rooms, {state.rooms, :cheers_from, self()}})
    {:noreply, state}
  end
end
