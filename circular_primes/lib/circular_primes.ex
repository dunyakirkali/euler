defmodule CircularPrimes do
  @doc """
      iex> CircularPrimes.prime?(41)
      true
  """
  def prime?(1), do: false
  def prime?(2), do: true
  def prime?(x), do: Enum.all?((2..round(:math.sqrt(x))), &(rem(x, &1) != 0))

  @doc """
      iex> CircularPrimes.solve(100, [])
      13
  """
  def solve(n, cps) when n == 1, do: Enum.count(cps)
  def solve(n, cps) do
    if circular_prime?(n) do
      solve(n - 1, [n | cps])
    else
      solve(n - 1, cps)
    end
  end

  def circular_prime?(n) do
    digits = Integer.digits(n)
    digit_count = Enum.count(digits)

    1..digit_count
    |> Enum.map(fn x ->
      digits
      |> left_rotate(x)
      |> Enum.join
      |> String.to_integer
      |> prime?()
    end)
    |> Enum.all?
  end

  def left_rotate(l, n \\ 1)
  def left_rotate([], _), do: []
  def left_rotate(l, 0), do: l
  def left_rotate([h | t], 1), do: t ++ [h]
  def left_rotate(l, n) when n > 0, do: left_rotate(left_rotate(l, 1), n-1)
  def left_rotate(l, n), do: right_rotate(l, -n)

  def right_rotate(l, n \\ 1)
  def right_rotate(l, n) when n > 0, do: Enum.reverse(l) |> ListRotation.left_rotate(n) |> Enum.reverse
  def right_rotate(l, n), do: left_rotate(l, -n)
end
