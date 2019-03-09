defmodule MyList do
  def sum(list), do: _sum(list, 0)

  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, head+total)

  def sum_new(list), do: _sum_new(list)
  defp _sum_new([]), do: 0
  defp _sum_new([head | tail]), do: head + _sum_new(tail)
end