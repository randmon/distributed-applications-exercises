defmodule Util do
  def maximum([x | xs]) do
    Enum.reduce(xs, x, fn next, x ->
      if next > x do
        next
      else
        x
      end
    end)
  end
end
