defmodule Demo.Part2.SubApplication do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      {Registry, keys: :unique, name: Demo.Part2.ChatRoomRegistry}, # Registry process with a unique key
      {Demo.Part2.ChatroomsDynamicSupervisor, []} # Dynamic supervisor to manage multiple chatrooms
    ]

    Supervisor.init(children, strategy: :rest_for_one)
  end
end
