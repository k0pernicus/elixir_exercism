defmodule Anagram do

  @spec get_sorted_list_from(String.t) :: [String.t]
  defp get_sorted_list_from(word) do
    word
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
  end

  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_sorted = get_sorted_list_from base
    base_lowercase = String.downcase base
    Enum.filter candidates, fn x -> (base_lowercase != String.downcase x) and (base_sorted == get_sorted_list_from x) end
  end
end
