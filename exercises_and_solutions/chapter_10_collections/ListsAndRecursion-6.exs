# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 10. Processing Collections — Enum and Stream • 102, Exercise: ListsAndRecursion-6
# Write a flatten(list) function that takes a list that may contain any number of sublists, which themselves may contain sublists, to any depth. It returns the elements of these lists as a flat list.
defmodule Flatten do
  def flatten(list, acc \\ []) do
    list
    |> Enum.reduce(acc, fn x, acc ->
      if is_list(x), do: flatten(x, acc), else: [x | acc]
    end)
    |> Enum.reverse()

    IO.puts(flatten([1, 2, 3, [4, 5, [6, 7, 8], 9], 10]))
  end
end
