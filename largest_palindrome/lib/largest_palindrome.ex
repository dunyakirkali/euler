defmodule LargestPalindrome do
  @moduledoc """
  A palindromic number reads the same both ways.
  The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  """

  @doc """
  Find the largest palindrome made from the product of two 3-digit numbers.

  ## Examples

      iex> LargestPalindrome.product(2)
      9009

      iex> LargestPalindrome.product(3)
      906609

  """
  def product(digit_count) do
    Enum.reduce(n_digited(digit_count), [], fn x, acc ->
      Enum.reduce(n_digited(digit_count), acc, fn y, acc ->
        if is_palindrome(x * y), do: [x * y | acc], else: acc
      end)
    end)
    |> Enum.max()
  end

  @doc """
      iex> LargestPalindrome.is_palindrome(9009)
      true

      iex> LargestPalindrome.is_palindrome(123321)
      true

      iex> LargestPalindrome.is_palindrome(12321)
      true

      iex> LargestPalindrome.is_palindrome(1234)
      false
  """
  def is_palindrome(no) do
    digits = Integer.digits(no)
    digits == Enum.reverse(digits)
  end

  @doc """
      iex> LargestPalindrome.n_digited(1)
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
  """
  def n_digited(digit_count) do
    start_no = :math.pow(10, digit_count - 1) |> round
    end_no = List.duplicate(9, digit_count) |> Integer.undigits()
    start_no..end_no |> Enum.to_list()
  end
end
