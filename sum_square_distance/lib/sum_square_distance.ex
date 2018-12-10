defmodule SumSquareDistance do
  @moduledoc """
  The sum of the squares of the first ten natural numbers is,

  1^2 + 2^2 + ... + 10^2 = 385

  The square of the sum of the first ten natural numbers is,

  (1 + 2 + ... + 10)^2 = 55^2 = 3025

  Hence the difference between the sum of the squares of the first ten natural
  numbers and the square of the sum is 3025 − 385 = 2640.
  """

  @doc """
  Find the difference between the sum of the squares of the first one hundred
  natural numbers and the square of the sum.

  ## Examples

      iex> SumSquareDistance.diff(10)
      2640

      iex> SumSquareDistance.diff(100)
      25_164_150

  """
  def diff(number) do
    bottom =
      number
      |> Range.new(1)
      |> Enum.map(&(:math.pow(&1, 2)))
      |> Enum.sum

    top =
      number
      |> Range.new(1)
      |> Enum.sum
      |> List.wrap
      |> Enum.map(&(:math.pow(&1, 2)))
      |> List.first

    round(top - bottom)
  end
end
