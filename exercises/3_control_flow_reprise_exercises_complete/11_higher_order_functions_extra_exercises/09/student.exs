defmodule Grades do
  defp get_code(g) when g in 0..7, do: "C"
  defp get_code(g) when g in 8..9, do: "B"
  defp get_code(g) when g in 10..20, do: "A"

  def to_code(grades) do
    Enum.join(Enum.map(grades, &get_code/1))
  end
end
