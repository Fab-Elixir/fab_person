defmodule Fab.PersonTest do
  use ExUnit.Case, async: true

  doctest Fab.Person

  setup tags do
    Application.put_env(:fab, :seed, seed(tags))
    :ok
  end

  defp seed(tags) do
    seed =
      (File.cwd!() <> "/lib/fab/person.ex")
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Enum.at(tags[:doctest_line] - 1)
      |> :binary.decode_unsigned()
      |> to_string()

    seed_len = String.length(seed)

    seed
    |> String.replace(~r/\d{#{seed_len - 7}}/, "")
    |> String.to_integer()
  end
end
