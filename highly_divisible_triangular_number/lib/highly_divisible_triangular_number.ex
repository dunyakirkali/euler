defmodule HighlyDivisibleTriangularNumber do
  use Memoize

  @doc """
      iex> HighlyDivisibleTriangularNumber.find(5)
      28
  """
  def find(divisors_count) do
    1
    |> Stream.iterate(&(&1 + 1))
    |> Stream.map(fn x ->
      triangular(x)
    end)
    |> Stream.drop_while(fn t ->
      t
      |> divisors
      |> Enum.count
      |> Kernel.<(divisors_count)
    end)
    |> Enum.take(1)
    |> List.first
  end

  @doc """
      iex> HighlyDivisibleTriangularNumber.triangular(1)
      1

      iex> HighlyDivisibleTriangularNumber.triangular(2)
      3

      iex> HighlyDivisibleTriangularNumber.triangular(3)
      6

      iex> HighlyDivisibleTriangularNumber.triangular(4)
      10

      iex> HighlyDivisibleTriangularNumber.triangular(5)
      15

      iex> HighlyDivisibleTriangularNumber.triangular(7)
      28
  """
  def triangular(n) when n == 1, do: 1
  def triangular(n) do
    n + triangular(n - 1)
  end

  @doc """
      iex> HighlyDivisibleTriangularNumber.divisors(1)
      [1]

      iex> HighlyDivisibleTriangularNumber.divisors(3)
      [1, 3]

      iex> HighlyDivisibleTriangularNumber.divisors(6)
      [1, 2, 3, 6]

      iex> HighlyDivisibleTriangularNumber.divisors(10)
      [1, 2, 5, 10]

      iex> HighlyDivisibleTriangularNumber.divisors(15)
      [1, 3, 5, 15]

      iex> HighlyDivisibleTriangularNumber.divisors(21)
      [1, 3, 7, 21]

      iex> HighlyDivisibleTriangularNumber.divisors(28)
      [1, 2, 4, 7, 14, 28]
  """
  def divisors(1), do: [1]
  def divisors(n), do: [1 | divisors(2, n, :math.sqrt(n))] |> Enum.sort

  defp divisors(k, n, q) when k > q, do: [n]
  defp divisors(k, n, q) when rem(n,k)>0, do: divisors(k+1,n,q)
  defp divisors(k, n, q) when k * k == n, do: [k | divisors(k+1,n,q)]
  defp divisors(k, n, q)                , do: [k,div(n,k) | divisors(k+1,n,q)]
end
