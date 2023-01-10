defmodule Bucket do
  use GenServer
  @max_capacity 10

  def start_link(_args) do
    GenServer.start_link(__MODULE__, 0)
  end

  # Get current amount of water
  def get() do
    pid = __MODULE__
    GenServer.call(pid, :get)
  end

  @impl GenServer
  def init(state) do
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  # Add water to bucket
  @impl GenServer
  def handle_cast({:add, amount}, state) do
    new_capacity = state + amount
    if new_capacity > @max_capacity do
      throw({:error, :overflow})
    else
      {:noreply, new_capacity}
    end
  end
end



# SUPERVISOR

defmodule LeakyCeiling do
  use Supervisor

  def start_link(amount_of_buckets) do
    Supervisor.start_link(__MODULE__, amount_of_buckets, name: __MODULE__)
  end

  def whereis(name) do
    # Get pid of bucket from the children
    pid = Supervisor.which_children(__MODULE__)
      |> Enum.filter(fn {n, _, _, _} -> n == name end)
      |> List.first()
      |> elem(1)

    case pid do
      nil -> :not_found
      _ -> pid
    end
  end

  def buckets_status() do
    Supervisor.which_children(__MODULE__)
    |> Enum.map(fn {id, pid, _, _} ->
      broken = not Process.alive?(pid)
      if broken do
        %{id: id, pid: pid, broken: broken}
      else
        %{id: id, pid: pid, broken: broken, water: GenServer.call(pid, :get)}
      end
    end)
  end

  @impl true
  def init(amount_of_buckets) do
    children = Enum.map(
      1..amount_of_buckets,
      &Supervisor.child_spec({Bucket, []}, id: :"b_#{&1}")
    )

    Supervisor.init(children, strategy: :one_for_all)
  end
end

LeakyCeiling.start_link(4)

# IO.inspect(Supervisor.count_children(LeakyCeiling))
# IO.inspect(Supervisor.which_children(LeakyCeiling))

# Get water from bucket :b_1
pid_b1 = LeakyCeiling.whereis(:b_1)
IO.inspect(GenServer.call(pid_b1, :get))

IO.inspect(LeakyCeiling.buckets_status())

# Add water to bucket :b_1
GenServer.cast(pid_b1, {:add, 5})
