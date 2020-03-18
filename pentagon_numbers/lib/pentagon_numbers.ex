defmodule PentagonNumbers do
  use Memoize

  @doc """
      iex> PentagonNumbers.solve()
      :world
  """
  def solve do
    min = 140
    max = 200
    range = (min..max)
    list = for j <- range, k <- range, l <- range, m <- range, do: {j, k, l, m}
    Stream.filter(list, fn {j, k, l, m} ->
      valid?(j, k, l, m)
    end)
    |> Enum.to_list
  end

  def valid?(j, k, l, m) do
    pentagonal(j) + pentagonal(k) == pentagonal(l)
    and
    pentagonal(j) - pentagonal(k) == pentagonal(m)
  end

  @doc """
      iex> PentagonNumbers.pentagonal(1)
      1

      iex> PentagonNumbers.pentagonal(2)
      5

      iex> PentagonNumbers.pentagonal(3)
      12
  """
  defmemo pentagonal(n) do
    div(n * (3 * n - 1), 2)
  end
end
