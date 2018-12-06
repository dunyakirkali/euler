defmodule ThreeOrFive do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
  The sum of these multiples is 23.
  """

  @doc """
  Find the sum of all the multiples of 3 or 5 below 1000.

  ## Examples

      iex> ThreeOrFive.sum_all([3, 5], 10)
      23

      iex> ThreeOrFive.sum_all([3, 5], 1000)
      233168

  """
  def sum_all(divisors, limit) do
    Enum.reduce(0..(limit - 1), 0, fn n, acc ->
      if Enum.any?(divisors, fn divisor -> rem(n, divisor) == 0 end), do: acc + n, else: acc
    end)
  end
end
