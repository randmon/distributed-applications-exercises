defmodule Temperature do
  def kelvin_to_celsius(t), do: t - 273.15
  def celsius_to_kelvin(t), do: t + 273.15
end
