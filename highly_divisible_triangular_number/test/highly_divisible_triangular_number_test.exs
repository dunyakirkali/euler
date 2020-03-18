defmodule HighlyDivisibleTriangularNumberTest do
  use ExUnit.Case
  doctest HighlyDivisibleTriangularNumber

  @tag timeout: :infinity
  test "solve" do
    assert HighlyDivisibleTriangularNumber.find(500) == 76576500
  end
end
