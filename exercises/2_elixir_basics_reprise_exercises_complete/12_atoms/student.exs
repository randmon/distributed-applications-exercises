defmodule Cards do
  def toNumber(x) when is_number(x), do: x
  def toNumber(:ace), do: 14
  def toNumber(:king), do: 13
  def toNumber(:queen), do: 12
  def toNumber(:jack), do: 11

  def higher?(x, y), do: toNumber(x) > toNumber(y)
end
