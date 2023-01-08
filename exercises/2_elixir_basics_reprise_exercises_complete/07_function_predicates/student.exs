defmodule Numbers do
  def even?(x), do: rem(x, 2) == 0
  def odd?(x), do: not even?(x)
end
