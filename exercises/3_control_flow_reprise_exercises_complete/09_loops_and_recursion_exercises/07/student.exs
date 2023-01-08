defmodule Util do
  def filter([], _), do: []
  def filter([x | xs], f) do
    if f.(x) do
      [x | filter(xs, f)]
    else
      filter(xs, f)
    end
  end
end
