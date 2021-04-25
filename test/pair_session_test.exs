defmodule PairSessionTest do
  use ExUnit.Case, async: true
  use ExUnitProperties, async: true

  doctest PairSession.Functions

  property "splits a list and returns nested chunked list" do
    check all(
            list_str <- list_of(string(:alphanumeric, min_length: 1, max_length: 3)),
            list_int <- list_of(integer()),
            size <- integer()
          ) do
      test_function = fn list, chunks ->
        cond do
          list === [] ->
            []

          chunks < 1 ->
            list

          true ->
            Enum.chunk_every(list, chunks)
        end
      end

      assert PairSession.chunker(list_str, size) ===
               test_function.(list_str, size)

      assert PairSession.chunker(list_int, size) ===
               test_function.(list_int, size)
    end
  end

  property "takes a random string and reverses it" do
    check all(string <- string(:alphanumeric, min_length: 3, max_length: 1_000)) do

      assert PairSession.reverse_string("hello") === "olleh"
      assert PairSession.reverse_string(string) === String.reverse(string)
    end
  end
end
