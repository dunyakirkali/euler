defmodule PythagoreanTriplet do
  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
  a^2 + b^2 = c^2

  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
  """

  @doc """
  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.

  ## Examples

      iex> PythagoreanTriplet.find(12)
      60

      iex> PythagoreanTriplet.find(1000)
      31_875_000

  """
  def find(sum) do
    range = 1..sum
    lists =
      Stream.flat_map range, fn a ->
        Stream.flat_map range, fn b ->
          Stream.flat_map range, fn c ->
            [{a, b, c}]
          end
        end
      end

    lists
    |> Stream.filter(fn {a, b, c} ->
      a < b and b < c
    end)
    |> Stream.filter(fn {a, b, c} ->
      :math.pow(a, 2) + :math.pow(b, 2) == :math.pow(c, 2)
    end)
    |> Stream.filter(fn {a, b, c} ->
      a + b + c == sum
    end)
    |> Enum.to_list
    |> Enum.map(fn {a, b, c} ->
      a * b * c
    end)
  end
end
