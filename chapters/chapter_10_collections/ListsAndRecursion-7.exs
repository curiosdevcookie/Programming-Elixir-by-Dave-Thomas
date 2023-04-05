# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 10. Processing Collections — Enum and Stream • 114, Exercise: ListsAndRecursion-7
# Use list comprehensions to return a list of the prime numbers from 2 to n:

defmodule Listy do
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from + 1, to)]

  def primes_up_to(n) do
    range = span(2, n)
    range -- for a <- range, b <- range, a <= b, b <= div(n, a), do: a * b
  end
end

# => [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
