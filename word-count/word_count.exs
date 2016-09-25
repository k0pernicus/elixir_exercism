defmodule Words do

  @punctuation ~r/!|"|'|@|#|\$|%|\^|&|\*|\(|\)|_|\+|=|:|,|~/

  @spec remove_punctuation(String.t) :: String.t
  defp remove_punctuation(string) do
    String.replace string, @punctuation, " "
  end

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence_splitted = sentence
      |> String.trim
      |> remove_punctuation
      |> String.downcase
      |> String.split 
    Enum.reduce sentence_splitted, %{}, (fn x, acc -> Map.update acc, x, 1, &(&1 + 1) end) 
  end
end
