defmodule NthPrime do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
  """

  @doc """
  What is the 10 001st prime number?

  ## Examples

      iex> NthPrime.fetch(6)
      13

      iex> NthPrime.fetch(10_001)
      104_743

  """
  def fetch(pos) do
    Primes.primes
    |> Enum.take(pos)
    |> List.last
  end
end
