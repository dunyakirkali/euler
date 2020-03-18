defmodule OddElimination do
  require Integer

  @moduledoc """
  Start from an ordered list of all integers from 1 to n. Going from left to
  right, remove the first number and every other number afterward until the end
  of the list. Repeat the procedure from right to left, removing the right most
  number and every other number from the numbers left. Continue removing every
  other numbers, alternating left to right and right to left, until a single
  number remains.

      Starting with n = 9, we have:
      1 2 3 4 5 6 7 8 9
      2 4 6 8
      2 6
      6

  Let P(n) be the last number left starting with a list of length n.
  Let S(n)=∑k=1..n P(k).

  You are given P(1)=1, P(9) = 6, P(1000)=510, S(1000)=268271.
  """

  @doc """
  Find S(10^18) mod 987654321.

  ## Examples

      iex> OddElimination.solve()
      277405

  """
  def solve() do
    pow(10, 18)
    |> s()
    |> rem(987_654_321)
  end

  def pmap(collection, func) do
    collection
    |> Enum.map(&(Task.async(fn -> func.(&1) end)))
    |> Enum.map(&Task.await/1)
  end

  @doc """
  Let S(n)=∑k=1..n P(k).

  ## Examples

      iex> OddElimination.s(1000)
      268271

  """
  def s(n) do
    1..n
    |> IO.inspect(label: "s")
    |> pmap(fn x ->
      p(x)
    end)
    |> Enum.to_list
    |> Enum.sum
  end

  @doc """
  Let P(n) be the last number left starting with a list of length n.

  ## Examples

      iex> OddElimination.p(1)
      1

      iex> OddElimination.p(9)
      6

      iex> OddElimination.p(1000)
      510

  """
  def p(n) when is_integer(n) do
    1..n
    |> IO.inspect(label: "p")
    |> Enum.to_list
    |> p()
  end

  def p(list) when is_list(list) and length(list) == 1 do
    list
    |> List.first
  end

  def p(list) when is_list(list) do
    list
    |> Enum.with_index
    |> Enum.filter(fn {_, index} -> rem(index, 2) == 1 end)
    |> Enum.map(fn {value, _} -> value end)
    |> Enum.reverse
    |> p()
  end

  @doc """
  Raise a number to it's power

  ## Examples

      iex> OddElimination.pow(12, 0)
      1

      iex> OddElimination.pow(12, 2)
      144

      iex> OddElimination.pow(10, 18)
      1_000_000_000_000_000_000

  """
  def pow(_, 0), do: 1
  def pow(x, n) when Integer.is_odd(n), do: x * pow(x, n - 1)
  def pow(x, n) do
    result = pow(x, div(n, 2))
    result * result
  end
end
