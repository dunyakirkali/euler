defmodule Primes do
  def primes do
    Stream.resource(
      fn -> [] end,
      &next_prime/1,
      fn (primes) -> primes end
    )
  end

  defp next_prime([]), do: {[2], [2]}
  defp next_prime(primes) do
    next = List.last(primes) + 1
    next_prime(next, primes)
  end
  defp next_prime(num, primes) do
    if is_prime?(num, primes) do
      {[num], primes ++ [num]}
    else
      next_prime(num + 1, primes)
    end
  end

  defp is_prime?(num, primes) do
    !Enum.find(primes, fn (prime) -> rem(num, prime) == 0 end)
  end
end
