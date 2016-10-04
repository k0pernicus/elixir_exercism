defmodule Scrabble do

  @score_chars %{
      "a" => 1,
      "b" => 3,
      "c" => 3,
      "d" => 2,
      "e" => 1,
      "f" => 4,
      "g" => 2,
      "h" => 4,
      "i" => 1,
      "j" => 8,
      "k" => 5,
      "l" => 1,
      "m" => 3,
      "n" => 1,
      "o" => 1,
      "p" => 3,
      "q" => 10,
      "r" => 1,
      "s" => 1,
      "t" => 1,
      "u" => 1,
      "v" => 4,
      "w" => 4,
      "x" => 8,
      "y" => 4,
      "z" => 10
    }

  defp get_score_from(char) do
    Map.get @score_chars, char, 0
  end

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score("") do
    0
  end

  def score(word) do
    word
    |> String.downcase
    |> String.codepoints
    |> List.foldl(0, (fn x, acc -> acc + get_score_from x end))
  end
end
