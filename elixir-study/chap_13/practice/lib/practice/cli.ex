defmodule Practice.CLI do
  @default_user 22
  def run(argv) do
    argv
    |> parse_args(argv)
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(
      argv,
      switches: [run: :boolean],
      aliases: [r: :run]
    )

    case parse do
      { [run: true], _, _} -> :run
      { _, [user, age], _ } -> {user, String.to_integer(age)}
      { _, [user], _ } -> {user, @default_user}
      _ -> :run
    end
  end
end