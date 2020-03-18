defmodule ThousandDigitFibonacciNumber do
  use Memoize

  @doc """
      iex> ThousandDigitFibonacciNumber.solve(3)
      12
  """
  def solve(digits) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.map(fn x ->
      {x, fibonacci(x)}
    end)
    |> Stream.drop_while(fn {x, f} ->
      f
      |> Integer.digits
      |> Enum.count
      |> Kernel.<(digits)
    end)
    |> Enum.take(1)
    |> List.first
    |> elem(0)
  end

  @doc """
      iex> ThousandDigitFibonacciNumber.fibonacci(1)
      1

      iex> ThousandDigitFibonacciNumber.fibonacci(2)
      1

      iex> ThousandDigitFibonacciNumber.fibonacci(3)
      2
  """
  defmemo fibonacci(n) when n == 1, do: 1
  defmemo fibonacci(n) when n == 2, do: 1
  defmemo fibonacci(n) do
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end
