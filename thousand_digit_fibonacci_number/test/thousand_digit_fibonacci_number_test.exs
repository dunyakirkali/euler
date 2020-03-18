defmodule ThousandDigitFibonacciNumberTest do
  use ExUnit.Case
  doctest ThousandDigitFibonacciNumber

  test "solve" do
    assert ThousandDigitFibonacciNumber.solve(1000) == 4782
  end
end
