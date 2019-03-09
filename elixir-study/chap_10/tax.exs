defmodule Tax do
  def calculation(order_lst, tax_lst) do
    _total = Stream.map(order_lst, &(_calculation(&1, tax_lst)))
    |> Enum.to_list
  end

  def _calculation(order=[id: _, ship_to: location, net_amount: amount], tax_lst) do
    total = amount + amount * Keyword.get(tax_lst, location, 0)
    Keyword.put(order, :total_amount, total)
  end

  def serach_data(order_lst, target) do
    Enum.filter(order_lst, fn [id: _, ship_to: location, net_amount: _] -> location === target end)
  end
end

tax_rates = [NC: 0.075, TX: 0.08]
order = [
  [id: 123, ship_to: :NC, net_amount: 100.00],
  [id: 124, ship_to: :OK, net_amount: 35.50],
  [id: 125, ship_to: :TX, net_amount: 24.00],
  [id: 126, ship_to: :TX, net_amount: 44.80],
  [id: 127, ship_to: :NC, net_amount: 25.00],
  [id: 128, ship_to: :MA, net_amount: 10.00],
  [id: 129, ship_to: :CA, net_amount: 102.00],
  [id: 130, ship_to: :NC, net_amount: 50.00]
]

cal_result = [
  [total_amount: 107.50, id: 123, ship_to: :NC, net_amount: 100.00],
  [total_amount: 35.50, id: 124, ship_to: :OK, net_amount: 35.50],
  [total_amount: 25.92, id: 125, ship_to: :TX, net_amount: 24.00],
  [total_amount: 48.384, id: 126, ship_to: :TX, net_amount: 44.80],
  [total_amount: 26.875, id: 127, ship_to: :NC, net_amount: 25.00],
  [total_amount: 10.0, id: 128, ship_to: :MA, net_amount: 10.00],
  [total_amount: 102.0, id: 129, ship_to: :CA, net_amount: 102.00],
  [total_amount: 53.75, id: 130, ship_to: :NC, net_amount: 50.00]
]

search_result = [
  [id: 125, ship_to: :TX, net_amount: 24.00],
  [id: 126, ship_to: :TX, net_amount: 44.80]
]

cal_func_result = Tax.calculation(order, tax_rates)
IO.puts("test: calculation -->  #{cal_func_result === cal_result}")

serach_func_reuslt = Tax.serach_data(order, :TX)
IO.puts("test: serach_data -->  #{serach_func_reuslt === search_result}")

