defmodule Rectangle do
  def area(width, height) do
    width * height
  end

  def area(side), do: area(side, side)
end
