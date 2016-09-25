defmodule Acronym do
  
  @punctuation ~r/!|"|'|@|#|\$|%|\^|&|\*|\(|\)|_|\+|=|:|,|~/
  
  @doc """
  Capitalize the string, without change the entire string.
  "hyperTeXt" => "HyperTeXt"
  """
  @spec capitalize(String.t()) :: String.t()
  defp capitalize(string) do
    (String.upcase String.first string) <> (String.slice string, (1..String.length(string)))
  end

  @doc """
  Get capitalized words from string, splitted by the whitespace character.
  "hellO world!" => ["HellO", "World!"]
  """
  @spec get_words(String.t()) :: [String.t()]
  defp get_words(string) do
    Enum.map (String.split string), &(capitalize(&1))
  end

  @doc """
  Get acronym for a word, in a string.
  "HyperText" => "HT"
  """
  @spec get_acronym(String.t()) :: String.t()
  defp get_acronym(word) do
    Enum.filter((String.codepoints word), fn c -> ((String.downcase c) != c) end)
    |> Enum.join
  end

  @doc """
  Get acronym for more than one word, in a list.
  "HyperText Simulator" => ['H', 'T', 'S']
  """
  @spec get_acronyms([String.t()]) :: [String.t()]
  defp get_acronyms(words) do
    Enum.map words, fn w -> get_acronym(w) end
  end

  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.replace(string, @punctuation, " ")
    |> get_words
    |> get_acronyms
    |> Enum.join
  end
end
