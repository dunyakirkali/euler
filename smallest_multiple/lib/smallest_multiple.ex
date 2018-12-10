defmodule SmallestMultiple do
  @moduledoc """
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  """

  @doc """
  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

  ## Examples

      iex> SmallestMultiple.find(1..10)
      2520

      iex> SmallestMultiple.find(1..20)
      232792560

  """
  def find(range) do
    find_start(range)
  end

  defp find_start(first..last) when first < last do
    start = find_start(first..(last - 1)) |> IO.inspect
    [0]
    |> Stream.cycle
    |> Enum.reduce_while(start, fn _, acc ->
      if Enum.all?(first..last, fn divisor -> rem(acc, divisor) == 0 end), do: {:halt, acc}, else: {:cont, acc + 1}
    end)
  end

  defp find_start(first..last) when first == last do
    [0]
    |> Stream.cycle
    |> Enum.reduce_while(1, fn _, acc ->
      if Enum.all?(first..last, fn divisor -> rem(acc, divisor) == 0 end), do: {:halt, acc}, else: {:cont, acc + 1}
    end)
  end

  defp do_find(range, start) do
    [0]
    |> Stream.cycle
    |> Enum.reduce_while(1, fn _, acc ->
      if Enum.all?(first..last, fn divisor -> rem(acc, divisor) == 0 end), do: {:halt, acc}, else: {:cont, acc + 1}
    end)
  end
end
