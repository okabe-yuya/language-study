defmodule Function do
  # def sum(0), do: 0
  # def sum(n), do: n + sum(n-1)
  #use when query in sum function
  def sum(0), do: 0
  def sum(n) when n > 0 do
    n + sum(n-1)
  end
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

defmodule Guesses do
  def guess(actual, s..e) do
    cal_value = div(s+e, 2)
    IO.puts "It is #{cal_value}"
    guess_checker(cal_value, actual, s..e)
  end

  defp guess_checker(cal_value, actual, s..e) when cal_value === actual do
    IO.puts cal_value
  end

  defp guess_checker(cal_value, actual, s..e) when cal_value > actual do
    guess(actual, s..cal_value-1)
  end

  defp guess_checker(cal_value, actual, s..e) when cal_value < actual do
    guess(actual, cal_value+1..e)
  end
end