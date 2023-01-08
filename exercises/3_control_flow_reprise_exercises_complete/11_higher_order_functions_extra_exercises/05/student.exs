defmodule Math do
  def factorial(n) do
    Enum.reduce(1..n, 1, fn a, b -> b * a end)
  end
end
