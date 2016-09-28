defmodule RunLengthEncoder do

  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  
  def encode("") do
    ""
  end

  def encode([]) do
    ""
  end
  
  def encode([c | t]) do
    encode({1, c, t})
  end

  def encode({n, c, []}) do
    "#{n}#{c}"
  end
  
  def encode({n, c, [c | t]}) do
    encode({n + 1, c, t})
  end
  
  def encode({n, c, [d | t]}) do
    encode({n, c, []}) <> encode([d | t]) 
  end
  
  def encode(string) do
    encode (String.codepoints string)
  end

  def decode("") do
    ""
  end
    
  def decode({n, []}) do
    ""
  end

  def decode({n, [c | t]}) do
    try do
      d = String.to_integer c
      decode({n * 10 + d, t})
    rescue
      _ -> (Enum.map_join (0..n-1), (fn x -> c end)) <> decode({0, t})
    end
  end

  def decode(string) do
    decode {0, (String.codepoints string)}
  end
end
