defmodule Util do
  def frequencies(xs) do
    xs
    |> Enum.reduce(%{}, fn x, acc ->
      Map.update(acc, x, 1, &(&1 + 1))
    end)
  end
end
