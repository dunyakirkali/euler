defmodule NamesScoresTest do
  use ExUnit.Case
  doctest NamesScores

  test "solve" do
    assert NamesScores.solve() == :world
  end
end
