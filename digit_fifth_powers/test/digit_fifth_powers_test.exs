defmodule DigitFifthPowersTest do
  use ExUnit.Case
  doctest DigitFifthPowers

  test "solve" do
    assert DigitFifthPowers.solve(5) == 443839
  end
end
