defmodule Shop do
  def discount(:standard), do: &(&1)
  def discount(:bronze), do: fn x -> x * 0.95 end
  def discount(:silver), do: fn x -> x * 0.90 end
  def discount(:gold), do: fn x -> x * 0.80 end
end
