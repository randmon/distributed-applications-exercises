defmodule Util do
  def frequencies(xs) do
    Enum.reduce(xs, %{}, fn x, freq ->
      Map.update(freq, x, 1, fn n -> n+1 end)
    end)
  end
end
