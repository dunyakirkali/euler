defmodule NamesScores do
  def solve() do
    file =
      "priv/input.txt"
      |> File.read!
      |> String.split(",")
      |> Enum.map(fn l ->
        String.replace(l, "\"", "")
      end)

    file
    |> Enum.reduce(0, fn x, acc ->
      acc + score(file, x)
    end)
  end

  def score(file, name) do
    pos =
      file
      |> Enum.sort
      |> Enum.find_index(fn l -> l == name end)
      |> Kernel.+(1)

    size =
      name
      |> String.to_charlist
      |> Enum.map(fn l ->
        l - 64
      end)
      |> Enum.sum

    pos * size
  end
end
