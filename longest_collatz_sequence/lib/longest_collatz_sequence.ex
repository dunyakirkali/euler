defmodule LongestCollatzSequence do
  def solve() do
    1..1_000_000
    |> Enum.map(fn x ->
      {x, collatz(x)}
    end)
    |> Enum.max_by(fn {_, cx} ->
      cx
    end)
    |> elem(0)
  end

  @doc """
      iex> LongestCollatzSequence.collatz(13)
      10
  """
  def collatz(start) do
    start
    |> Stream.iterate(&(next(&1)))
    |> Stream.take_while(fn x ->
      x != 1
    end)
    |> Enum.count
    |> Kernel.+(1)
  end

  @doc """
      iex> LongestCollatzSequence.next(13)
      40

      iex> LongestCollatzSequence.next(40)
      20

      iex> LongestCollatzSequence.next(20)
      10
  """
  def next(n) when rem(n, 2) == 0, do: div(n, 2)
  def next(n) when rem(n, 2) != 0, do: 3 * n + 1
end
