defmodule Store do
  def total_cost(prices, basket) do
    basket
    |> Enum.map(fn x -> prices[x] end)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end
end
