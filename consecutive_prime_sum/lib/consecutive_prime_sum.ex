defmodule ConsecutivePrimeSum do
  @doc """
      iex> ConsecutivePrimeSum.prime?(41)
      true
  """
  def prime?(1), do: false
  def prime?(2), do: true
  def prime?(x), do: Enum.all?((2..round(:math.sqrt(x))), &(rem(x, &1) != 0))

  @doc """
      iex> ConsecutivePrimeSum.solve(100)
      41
  """
  def solve(n) do
    2..n
    |> Stream.filter(fn x ->
      prime?(x)
    end)
    |> Enum.to_list
    |> IO.inspect
    |> Enum.reduce_while(0, fn x, acc ->
      if prime?(acc) and acc + x > n do
        {:halt, acc}
      else
        if acc + x < n do
          {:cont, acc + x}
        else
          {:halt, acc}
        end
      end
    end)
  end
end
