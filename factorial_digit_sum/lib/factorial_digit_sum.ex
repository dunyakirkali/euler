defmodule FactorialDigitSum do
  @doc """
      iex> FactorialDigitSum.solve(10)
      27
  """
  def solve(n) do
    n
    |> factorial
    |> Integer.digits
    |> Enum.sum
  end

  @doc """
      iex> FactorialDigitSum.factorial(10)
      3628800
  """
  def factorial(n) when n == 1, do: 1
  def factorial(n) do
    n * factorial(n - 1)
  end
end
