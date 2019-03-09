prefix =
  fn str1 ->
    fn
      str2 -> IO.puts str1 <> str2
      end
  end

prev = prefix.("yamada")
prev.("tarou")