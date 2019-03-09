defmodule MapControll do
  def search_user_info(list, user_name) do
    Enum.filter(list, &(&1[:name] === user_name))
  end

  def age_train(list) do
    Enum.map(list, fn %{ name: n, age: a } -> %{ name: n, age: a * 10} end)
  end

  def pipeline_train(list) do
    result = Stream.filter(list, &(&1[:age] > 20))
             |> Stream.map(&(&1[:name] <> " --> is adult"))
             |> Enum.to_list
    result
  end
end

test_data = [
  %{name: "okabe", age: 21},
  %{name: "yuuya", age: 22},
  %{name: "masashi", age: 18},
  %{name: "elixir", age: 34}
]

search_result = [
  %{name: "okabe", age: 21}
]

search_func_result = MapControll.search_user_info(test_data, "okabe")
IO.inspect(search_func_result)
IO.puts("test: serach_user_info --> #{search_func_result === search_result}")
