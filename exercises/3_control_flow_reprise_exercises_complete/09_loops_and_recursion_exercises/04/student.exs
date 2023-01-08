defmodule Exercise do
  def range(a, b) do
    if a >= b do
      []
    else
      [a | range(a + 1, b)]
    end
  end
end
