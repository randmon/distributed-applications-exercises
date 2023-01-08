defmodule Math do
  def prime?(n) do
    n == 2 or
    (n > 1 and Enum.all?(2..n-1, fn x -> rem(n, x) != 0 end))
  end
end
