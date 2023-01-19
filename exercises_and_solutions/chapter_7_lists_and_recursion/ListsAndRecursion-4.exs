# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 7. Lists and Recursion • 81, Exercise: ListsAndRecursion-4

defmodule LAR4 do
  # start number, end number … return a list:
  def list_span(start_num, end_num) when start_num>end_num, do: []
  def list_span(start_num, end_num) when start_num==end_num, do: [start_num]
  def list_span(start_num, end_num) do
    [start_num | list_span(start_num+1, end_num)]
  end

  IO.puts(LAR4.list_span(4, 7)) # [4, 5, 6, 7]
  IO.puts(LAR4.list_span(7, 4)) # []
  IO.puts(LAR4.list_span(4, 4)) # [4]
end
