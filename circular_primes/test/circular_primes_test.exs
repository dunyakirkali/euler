defmodule CircularPrimesTest do
  use ExUnit.Case
  doctest CircularPrimes

  test "solve" do
    assert CircularPrimes.solve(1_000_000, []) == 55
  end
end
