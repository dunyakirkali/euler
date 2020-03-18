defmodule IntegerRightTriangles do
  @doc """
      iex> IntegerRightTriangles.solve(120)
      120
  """
  def solve(p) do
    1..p
    |> Enum.map(fn x ->
      {x, count(x)}
    end)
    |> Enum.max_by(fn {_x, res} ->
      res
    end)
    |> elem(0)
  end

  @doc """
      iex> IntegerRightTriangles.count(120)
      3
  """
  def count(p) do
    options = for a <- 1..p, b <- a..p, c <- b..p, do:  [a, b, c]

    options
    |> Enum.uniq
    |> Enum.filter(fn [a, b, c] ->
      a + b + c == p
    end)
    |> Enum.map(fn tri ->
      Enum.sort(tri)
    end)
    |> Enum.filter(fn [a, b, c] ->
      :math.pow(a, 2) + :math.pow(b, 2) == :math.pow(c, 2)
    end)
    |> Enum.count
  end
end
