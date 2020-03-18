defmodule PowerDigitSumTest do
  use ExUnit.Case
  doctest PowerDigitSum

  test "greets the world" do
    assert PowerDigitSum.solve(1000) == 1366
  end
end
