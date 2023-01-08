defmodule Bank do
  def largest_expense_index(history) do
    history
    |> Enum.zip(tl(history))
    |> Enum.map(fn {x1, x2} -> x2-x1 end)
    |> Enum.with_index(0)
    |> Enum.min_by(fn {x, _} -> x end)
    |> elem(1)
  end
end
