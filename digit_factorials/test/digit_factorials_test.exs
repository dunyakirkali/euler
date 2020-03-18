defmodule DigitFactorialsTest do
  use ExUnit.Case
  doctest DigitFactorials

  test "solve" do
    assert DigitFactorials.solve() == 40730
  end
end
