defmodule Numbers do
  def odd?(x) do
    rem(x, 2) != 0
  end

  def even?(x), do: !odd?(x)
end
