defmodule Cards do
  def same_suit?({_, suit}, {_, suit}), do: true
  def same_suit?(_, _), do: false
end
