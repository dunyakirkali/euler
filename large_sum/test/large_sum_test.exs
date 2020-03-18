defmodule LargeSumTest do
  use ExUnit.Case
  doctest LargeSum

  test "solve" do
    assert LargeSum.solve() == "5537376230"
  end
end
