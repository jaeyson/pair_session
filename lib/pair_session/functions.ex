defmodule PairSession.Functions do
  @moduledoc """
  Sample doc for Pair Session
  """

  @doc """
  Splits a list (first argument) into groups the length
  of size (second argument) and returns them as a
  two-dimensional list.

  ## Examples

      iex> PairSession.chunker(["a", "b", "c", "d"], 2)
      [["a", "b"], ["c", "d"]]

      iex> PairSession.chunker([0, 1, 2, 3, 4, 5], 3)
      [[0, 1, 2], [3, 4, 5]]

      iex> PairSession.chunker([0, 1, 2, 3, 4, 5], 2)
      [[0, 1], [2, 3], [4, 5]]

  """
  @spec chunker(Enumerable.t(), integer) :: list(Enumerable.t())
  def chunker([], _size), do: []
  def chunker(list, size) when size < 1, do: list

  def chunker(list, size) do
    do_chunker([], [], list, size, 0)
  end

  defp do_chunker(list_a, list_b, [], _, _) do
    list_a ++ [list_b]
  end

  defp do_chunker(list_a, list_b, [h | t] = _, size, counter)
       when counter < size do
    do_chunker(list_a, list_b ++ [h], t, size, counter + 1)
  end

  defp do_chunker(list_a, list_b, [h | t] = _, size, counter)
       when counter === size do
    do_chunker(list_a ++ [list_b], [h], t, size, 1)
  end

  @doc """
  Reverses a string

  ## Examples

      iex> PairSession.reverse_string("hello")
      "olleh"

  """
  @spec reverse_string(String.t()) :: String.t()
  def reverse_string(""), do: ""

  def reverse_string(<<letter::utf8, rest::binary>> = _string),
    do: <<letter>> <> reverse_string(rest)
end
