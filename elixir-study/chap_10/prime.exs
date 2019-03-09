defmodule Prime do
  def span(from, to), do: _span(from, to)
  defp _span(from, to) when from === to do
    [to]
  end
  defp _span(from, to) when from < to do
    [from] ++ _span(from+1, to)
  end

  def prime(num, start \\ 2) do
    list = span(start, num)
    for n <- list, do: n
  end

  def span_prime(from \\ 2, to) do
    with list = span(2, to)
    do
      for x <- span(from, to), Enum.all?(list, &(&1 >= x or rem(x,&1) != 0)), do: x
    end
  end
end

Prime.prime(17)