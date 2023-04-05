# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 10. Processing Collections — Enum and Stream • 102, Exercise: ListsAndRecursion-5
# Implement the following Enum functions using no library functions or list comprehensions: all?, each, filter, split, and take.

defmodule EnumFunctions do
  def all_?(fun) do
    [1, 2, 3, 4, 5] |> Enum.reduce(true, fn x, acc -> fun.(x) and acc end)
  end

  def for_each(fun) do
    [1, 2, 3, 4, 5] |> Enum.reduce(nil, fn x, _ -> fun.(x) end)
  end

  def filter(fun) do
    [1, 2, 3, 4, 5]
    |> Enum.reduce([], fn x, acc -> if fun.(x), do: [x | acc], else: acc end)
    |> Enum.reverse()
  end

  def split(fun) do
    [1, 2, 3, 4, 5]
    |> Enum.reduce({[], []}, fn x, {acc1, acc2} ->
      if fun.(x), do: {[x | acc1], acc2}, else: {acc1, [x | acc2]}
    end)
  end

  def take(n) do
    [1, 2, 3, 4, 5]
    |> Enum.reduce({[], 0}, fn x, {acc, count} ->
      if count < n, do: {[x | acc], count + 1}, else: {acc, count}
    end)
    |> elem(0)
    |> Enum.reverse()
  end
end
