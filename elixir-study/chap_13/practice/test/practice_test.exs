defmodule PracticeTest do
  use ExUnit.Case
  doctest Practice

  import Practice.CLI, only: [parse_args: 1]
  test "run: returned by option parsing with -h and --help options" do
    assert parse_args(["-r", "anything"]) == :run
    assert parse_args(["--run", "anything"]) == :run
  end

  test "two values returned if two given" do
    assert parse_args(["user", "33"]) == {"user", 33}
  end

  test "default values return" do
    assert parse_args(["okabe"]) == {"okabe", 22}
  end
end
