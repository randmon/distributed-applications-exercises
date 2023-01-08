defmodule Grades do
  def all_passed?(grades) do
    grades
    |> Enum.filter(fn g -> is_number(g) end)
    |> Enum.all?(fn g -> g >= 10 end)
  end
end
