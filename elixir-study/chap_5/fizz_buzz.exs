fizz_buzz = fn
  0, 0, _ -> IO.puts "FizzBuzz"
  0, _, _ -> IO.puts "Fizz"
  _, 0, _ -> IO.puts "Buzz"
  _, _, c -> IO.puts c
end

#test
fizz_buzz.(0, 0, 3)
fizz_buzz.(0, 3, 3)
fizz_buzz.(3, 0, 3)
fizz_buzz.(0, 0, 0)


check_fizz_buzz = fn (n) -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end

check_fizz_buzz.(10)
check_fizz_buzz.(11)
check_fizz_buzz.(12)
check_fizz_buzz.(13)
check_fizz_buzz.(14)
check_fizz_buzz.(15)
check_fizz_buzz.(16)
check_fizz_buzz.(17)
