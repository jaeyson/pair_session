defmodule PairSession.Calculator do
  
  def sum(string \\ "0") do
    string
    |> String.split(~r{\D}, trim: true)
    |> parse_two_num()
  end
  
  def parse_two_num(list_numbers) do
    Enum.map(list_numbers, fn number ->
      {int, _} = Integer.parse(number)
      int
    end)
    |> Enum.sum()
  end
end