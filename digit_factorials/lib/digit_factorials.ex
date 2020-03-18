defmodule DigitFactorials do
  use Memoize

  def solve do
    10..3_000_000
    |> Enum.map(fn x ->
      if valid?(x) do
        x
      else
        0
      end
    end)
    |> Enum.sum
  end

  @doc """
      iex> DigitFactorials.valid?(145)
      true
  """
  def valid?(n) do
    n
    # |> IO.inspect(label: "n")
    |> Integer.digits
    |> Enum.map(fn d ->
      factorial(d)
    end)
    |> Enum.sum
    # |> IO.inspect(label: "f")
    |> Kernel.==(n)
  end

  defmemo factorial(n) when n == 0, do: 1
  defmemo factorial(n) when n == 1, do: 1
  defmemo factorial(n) do
    n * factorial(n - 1)
  end
end
