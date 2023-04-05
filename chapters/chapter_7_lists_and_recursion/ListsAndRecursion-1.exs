# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 7. Lists and Recursion • 77, Exercise: MExercise: ListsAndRecursion-1

defmodule LAR1 do
  def mapsum([],fun), do: 0
  def mapsum(list,fun) do
    [head|tail] = list
    mapsum(tail,fun) + fun.(head)
  end
  IO.puts(LAR1.mapsum([1,2,3,4], fn(x) -> x * x end)) # 30
  IO.puts(LAR1.mapsum([1,2,3,4], &(&1*&1))) # 30
  IO.puts(LAR1.mapsum([1,2,3,4], &1*&1)) # 30
end
