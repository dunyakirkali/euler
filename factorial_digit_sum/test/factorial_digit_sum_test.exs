defmodule FactorialDigitSumTest do
  use ExUnit.Case
  doctest FactorialDigitSum

  test "solve" do
    assert FactorialDigitSum.solve(100) == 648
  end
end
