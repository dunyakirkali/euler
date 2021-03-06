defmodule EvenFibonacciNumbers do
  @moduledoc """
  Each new term in the Fibonacci sequence is generated by adding the previous two terms.
  By starting with 1 and 2, the first 10 terms will be:

  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
  """

  @doc """
  By considering the terms in the Fibonacci sequence whose values do not exceed four million,
  find the sum of the even-valued terms.

  ## Examples

      iex> EvenFibonacciNumbers.sum(90)
      44

      iex> EvenFibonacciNumbers.sum(4_000_000)
      4_613_732

  """
  def sum(maximum) do
    2..maximum
    |> Stream.map(&fib/1)
    |> Stream.take_while(&(&1 <= maximum))
    |> Stream.filter(&even?/1)
    |> Enum.sum
  end

  @doc """
  Odd ?

  ## Examples

      iex> EvenFibonacciNumbers.even?(10)
      true

      iex> EvenFibonacciNumbers.even?(3)
      false

  """
  def even?(n) do rem(n, 2) == 0 end


  @doc """
  Fibonacci

  ## Examples

      iex> EvenFibonacciNumbers.fib(0)
      0

      iex> EvenFibonacciNumbers.fib(1)
      1

      iex> EvenFibonacciNumbers.fib(2)
      1

      iex> EvenFibonacciNumbers.fib(3)
      2

  """
  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n-1) + fib(n-2) end
end
