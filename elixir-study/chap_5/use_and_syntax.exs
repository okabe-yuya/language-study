result_a = Enum.map [1,2,3,4], fn x -> x + 2 end
result_aa = Enum.map [1,2,3,4], &(&1 + 2)

reuslt_b = Enum.map [1,2,3,4], fn x -> IO.inspect x end
result_bb = Enum.each [1,2,3,4], &(IO.inspect &1)
