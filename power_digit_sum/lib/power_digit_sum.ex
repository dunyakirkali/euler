defmodule PowerDigitSum do
  @doc """
      iex> PowerDigitSum.solve(15)
      26
  """
  def solve(power) do
    :math.pow(2, power)
    |> Kernel.trunc
    |> Integer.digits
    |> Enum.sum
  end
end
