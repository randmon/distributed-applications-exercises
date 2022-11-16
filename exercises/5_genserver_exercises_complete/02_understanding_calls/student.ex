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

  def handle_call(:list_rooms, _from, state) do
    {:reply, state.rooms, state}
  end

  def add_room(building_name, room_name, n_people) do
    new_room = %{building_name: building_name, room_name: room_name, n_people: n_people}
    GenServer.cast(__MODULE__, {:add_room, new_room})
  end

  def handle_cast({:add_room, new_room}, state) do
    # Rooms are unique by room name, we overwrite the old room if it exists
    new_rooms = Enum.reject(state.rooms, &(&1.room_name == new_room.room_name)) ++ [new_room]
    {:noreply, %{state | rooms: new_rooms}}
  end
end
