defmodule Factorial do
  alias Factorial

  def of(0), do: 1
  def of(n), do: n * of(n - 1)

  #Better:
  def of_guard(n) when n === 0, do: 1
  def of_guard(n) when n > 0 and is_integer(n), do: n * of_guard(n - 1)
  def of_guard(n) when n < 0, do: IO.puts("Please provide a positive integer!")
end
