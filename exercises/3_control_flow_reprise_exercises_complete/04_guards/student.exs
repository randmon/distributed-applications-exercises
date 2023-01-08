defmodule Numbers do
  def even?(x) when is_number(x), do: rem(x, 2) == 0
  def odd?(x) when is_number(x), do: not even?(x)
end
