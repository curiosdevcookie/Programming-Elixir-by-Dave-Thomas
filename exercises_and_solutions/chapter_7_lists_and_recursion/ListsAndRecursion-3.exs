# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 7. Lists and Recursion • 78, Exercise: ListsAndRecursion-3

defmodule LAR3 do

  def caesar([], n), do: []
  def caesar([head | tail],n) when head+n<?z do
    [head + n | caesar(tail, n)]
  end
  def caesar([head | tail],n) do
    [head + n - 26 | caesar(tail, n)]
  end
  IO.puts(LAR3.caesar([1, 2, 3, 4, 5], 1)) # [2, 3, 4, 5, 6]
  IO.puts(LAR3.caesar([1, 2, 3, 4, 5], 2)) # [3, 4, 5, 6, 7]
  IO.puts(LAR3.caesar('EVA', 1)) # 'FWB'
  IO.puts(LAR3.caesar('EVA', 2)) # 'GXC'
  IO.puts(LAR3.caesar('elixir', 3)) # 'holalu'
  IO.puts(LAR3.caesar('lizzy', 1)) # 'mjaaz'/'mjaa`'
end
