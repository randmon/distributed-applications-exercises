defmodule Cards do
  defp value(x) when is_number(x), do: x
  defp value(:jack), do: 11
  defp value(:queen), do: 12
  defp value(:king), do: 13
  defp value(:ace), do: 14

  def higher?({value1, suit}, {value2, suit}, _), do: value(value1) > value(value2)
  def higher?({_, suit1}, {_, trump}, trump), do: false
  def higher?(_, _, _), do: true
end
