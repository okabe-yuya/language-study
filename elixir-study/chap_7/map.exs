defmodule MapList do
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def mapsum([], value, _func), do: value
  def mapsum([head | tail], value, func) do
    func.(head) + mapsum(tail, value, func)
  end
  def max([head | tail]), do: _max(tail, head)
  defp _max([], head), do: head
  defp _max([head | tail], value) when head > value do
    _max(tail, head)
  end
  defp _max([head | tail], value) when head < value do
    _max(tail, value)
  end

  def span(from, to), do: _span(from, to)
  defp _span(from, to) when from === to do
    [to]
  end
  defp _span(from, to) when from < to do
    [from] ++ _span(from+1, to)
  end
end

# defmodule List do
#   def max([head | tail]), do: _max(tail, head)
#   defp _max([], head), do: head
#   defp _max([head | tail], value) when head > value do
#     _max(tail, head)
#   end
#   defp _max([head | tail], value) when head < value do
#     _max(tail, value)
#   end
# end