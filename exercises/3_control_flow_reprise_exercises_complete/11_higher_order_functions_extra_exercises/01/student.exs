defmodule Grades do
  def remove_na(grades) do
    Enum.filter(grades, fn g -> g != :na end)
  end
end
