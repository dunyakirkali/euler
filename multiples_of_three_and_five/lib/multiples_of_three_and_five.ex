defmodule MultiplesOfThreeAndFive do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
  The sum of these multiples is 23.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MultiplesOfThreeAndFive.sum(10)
      23

      iex> MultiplesOfThreeAndFive.sum(1000)
      233168

  """
  def sum(maximum) do
    1..(maximum - 1)
    |> Enum.to_list
    |> Enum.filter(fn(x) -> rem(x, 3) == 0 || rem(x, 5) == 0 end)
    |> Enum.sum
  end
end
