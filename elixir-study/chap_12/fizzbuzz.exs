defmodule FizzBuzz do
  def case_fizzbuzz(num) do
    result_t = _rem_result(num, 3) === 0
    result_f = _rem_result(num, 5) === 0
    result = result_t and result_f
    case result do
      true -> IO.puts("FizzBuzz")
      false ->
        if result_t do
          IO.puts("Fizz")
        else
          if result_f do
            IO.puts("Buzz")
          end
        end
        IO.puts(num)
    end
  end

  def cond_fizzbuzz(num) do
    cond do
      _rem_result(num, 3) === 0 and _rem_result(num, 5) === 0 -> IO.puts("FizzBuzz")
      _rem_result(num, 3) === 0 -> IO.puts("Fizz")
      _rem_result(num, 5) === 0 -> IO.puts("Buzz")
      true -> IO.puts(num)
    end
  end

  defp _rem_result(num, denm), do: rem(num, denm)
end

_c_result = FizzBuzz.case_fizzbuzz(15) #fizzbuzz
_cc_result = FizzBuzz.cond_fizzbuzz(15) #fizzbuzz

