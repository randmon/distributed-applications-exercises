defmodule Util do
  def frequencies([]), do: %{}
  def frequencies([x|xs]) do
    Map.update(frequencies(xs), x, 1, &(&1 + 1))
  end
end
