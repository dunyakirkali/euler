defmodule IntegerRightTrianglesTest do
  use ExUnit.Case
  doctest IntegerRightTriangles

  @tag timeout: :infinity
  test "solve" do
    assert IntegerRightTriangles.solve(1000) == :world
  end
end
