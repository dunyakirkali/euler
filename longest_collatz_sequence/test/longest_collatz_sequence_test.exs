defmodule LongestCollatzSequenceTest do
  use ExUnit.Case
  doctest LongestCollatzSequence

  test "solve" do
    assert LongestCollatzSequence.solve() == 837799
  end
end
