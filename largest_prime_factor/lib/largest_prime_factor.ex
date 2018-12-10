defmodule LargestPrimeFactor do
  @moduledoc """
  The prime factors of 13195 are 5, 7, 13 and 29.
  """

  @doc """
  What is the largest prime factor of the number 600851475143 ?

  ## Examples

      iex> LargestPrimeFactor.factors(13195)
      29

      iex> LargestPrimeFactor.factors(600_851_475_143)
      6857

  """
  def factors(maximum) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.filter(&(prime?(&1)))
    |> Enum.take_while(&(&1 < round(:math.sqrt(maximum))))
    |> Enum.filter(fn(x) -> rem(maximum, x) == 0 end)
    |> List.last
  end

  def prime?(x) when x in [2, 3, 5, 7, 11, 13, 17], do: true
  def prime?(x) do
    Enum.all?((2..round(:math.sqrt(x))), fn(n) -> rem(x, n) != 0 end)
  end
end
