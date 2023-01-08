defmodule Grades do
  def any_tolerable?(grades) do
    Enum.any?(grades, fn g -> g in [8,9] end)
  end
end
