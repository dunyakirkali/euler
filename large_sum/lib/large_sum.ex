defmodule LargeSum do
  def solve do
    "priv/input.txt"
    |> File.read!
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      String.to_integer(x)
    end)
    |> Enum.sum
    |> Integer.digits
    |> Enum.take(10)
    |> Enum.join
  end
end
