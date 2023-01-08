defmodule Util do
  def reduce([], init, _), do: init
  def reduce([x | xs], init, f) do
    reduce(xs, f.(x, init), f)
  end
end
