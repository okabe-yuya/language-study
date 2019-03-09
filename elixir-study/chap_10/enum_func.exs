defmodule EnumList do
  def all?([], _func), do: true
  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _func), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []
  def filter([head | tail], func) do
    result = func.(head)
    if result do
      [head] ++ filter(tail, func)
    else
      filter(tail, func)
    end
  end

  def split(list, idx) do
    length = Enum.count(list)
    if length < abs(idx) do
      if idx > 0 do
        { list, [] }
      else
        { [], list }
      end
    else
      _split(list, idx, [])
    end
  end
  defp _split([], _idx, accum), do: accum
  defp _split([head | tail], idx, accum) when idx === 0 do
    {accum, [head] ++ tail}
  end
  defp _split([head | tail], idx, accum) do
    if idx > 0 do
      _split(tail, idx-1, accum ++ [head])
    else
      _split(tail, idx+1, accum ++ [head])
    end
  end

  def take(list, idx) do
    if idx < 0 do
      r_list = Enum.reverse(list)
      IO.inspect r_list
      _take(r_list, idx, [])
    else
      _take(list, idx, [])
    end
  end
  defp _take([], _idx, accum), do: accum
  defp _take([_head | _tail], idx, accum) when idx === 0, do: accum
  defp _take([head | tail], idx, accum) do
    if idx > 0 do
      _take(tail, idx-1, accum ++ [head])
    else
      IO.inspect idx
      _take(tail, idx+1, accum ++ [head])
    end
  end

  def flatten(list), do: _flatten(list, [])
  defp _flatten([], accum), do: accum
  defp _flatten([head | tail], accum) do
    if is_list(head) do
      _flatten(head ++ tail, accum)
    else
      _flatten(tail, accum ++ [head])
    end
  end
end

list = [1, [2,3,[4]],5,[[6]]]