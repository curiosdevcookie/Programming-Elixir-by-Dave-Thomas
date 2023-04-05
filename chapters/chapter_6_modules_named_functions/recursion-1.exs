defmodule Recursion do
  alias Recursion

# Exercise: ModulesAndFunctions-4

def sum(n) when n <= 0, do: IO.puts "Please enter a positive integer."
def sum(n) when n > 0, do: n + sum(n - 1)

# Exercise: ModulesAndFunctions-5

def gcd(x, y) when y == 0, do: x
def gcd(x, y) when x == 0, do: y
def gcd(x, y), do: gcd(y, rem(x, y))


end
