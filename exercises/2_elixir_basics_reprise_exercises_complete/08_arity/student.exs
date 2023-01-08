defmodule Rectangle do
  def area(width, height), do: width * height
  def area(side), do: area(side, side)
end
