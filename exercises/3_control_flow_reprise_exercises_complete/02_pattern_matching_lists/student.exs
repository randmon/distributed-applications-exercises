defmodule Util do
  def first([x | _]), do: x
  def second([_, x | _]), do: x
  def third([_, _, x | _]), do: x

  def size([]), do: 0
  def size([_ | xs]), do: 1 + size(xs)

  def last([x]), do: x
  def last([_ | x]), do: last(x)
end
