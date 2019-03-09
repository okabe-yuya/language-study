defmodule Parse do
  def number(str), do: _number(str, 0)
  defp _number([], value), do: value
  defp _number([head | tail], value)
    when head in '0123456789' do
      _number(tail, value*10 + head - ?0)
  end
  defp _number([head | _tail], _), do: head

  def anagram?(word1, word2) do
    Enum.sort(word1) === Enum.sort(word2)
  end

  def calculate(str) do
    escape_str = ~w[#{str}]c |> Enum.map(&(Parse.number(&1)))
    escape_str
  end
end

anagram_func_result = Parse.anagram?('おかべ', 'かべお')
IO.puts("test: for anagram? --> #{anagram_func_result === true}")