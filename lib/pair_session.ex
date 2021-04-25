defmodule PairSession do
  alias PairSession.Functions

  defdelegate chunker(list, chunk_by), to: Functions
  defdelegate reverse_string(string), to: Functions
end
