defmodule DigitFifthPowers do
  @doc """
      iex> DigitFifthPowers.solve(4)
      19316
  """
  def solve(power) do
    2..1_000_000
    |> Enum.filter(fn x ->
      x
      |> Integer.digits
      |> Enum.map(fn d ->
        :math.pow(d, power)
      end)
      |> Enum.sum
      |> Kernel.==(x)
    end)
    |> Enum.sum
  end
end
