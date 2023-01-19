# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 7. Lists and Recursion • 77, Exercise: ListsAndRecursion-2

defmodule LAR2 do
  def find_max_in_list([], acc, _fun), do: acc
  def find_max_in_list([x], acc, _fun), do: x
  def find_max_in_list([head | tail], acc, fun) do
   if fun.(head, acc) do
     find_max_in_list(tail, head, fun)
   else
     find_max_in_list(tail, acc, fun)
  end
 end

 IO.puts(LAR2.find_max_in_list([1, 2, 8, 4, 5], 0, fn(x, acc) -> x > acc end)) # 8

 # What happens under the hood is:
  #find_max_in_list([1, 2, 8, 4, 5], 0, fn(x, acc) -> x > acc end)
  #if 1 > 0 then
    #find_max_in_list([2, 8, 4, 5], 1, fn(x, acc) -> x > acc end)
  #else
    #find_max_in_list([2, 8, 4, 5], 0, fn(x, acc) -> x > acc end)
  #end
  #if 2 > 1 then
    #find_max_in_list([8, 4, 5], 2, fn(x, acc) -> x > acc end)
  #else
    #find_max_in_list([8, 4, 5], 1, fn(x, acc) -> x > acc end)
  #end
  #if 8 > 2 then
    #find_max_in_list([4, 5], 8, fn(x, acc) -> x > acc end)
  #else
    #find_max_in_list([4, 5], 2, fn(x, acc) -> x > acc end)
  #end
  #if 4 > 8 then
    #find_max_in_list([5], 4, fn(x, acc) -> x > acc end)
  #else
    #find_max_in_list([5], 8, fn(x, acc) -> x > acc end)
  #end
  #if 5 > 4 then
    #find_max_in_list([], 5, fn(x, acc) -> x > acc end)
  #else
    #find_max_in_list([], 4, fn(x, acc) -> x > acc end)
  #end
  #if [] > 5 then
    #find_max_in_list([], 5, fn(x, acc) -> x > acc end)
  #else
    #find_max_in_list([], 5, fn(x, acc) -> x > acc end)
  #end

  IO.puts(LAR2.find_max_in_list([0], 0, fn(x, acc) -> x > acc end)) # 0

  # What happens under the hood is:
  #find_max_in_list([0], 0, fn(x, acc) -> x > acc end)
  #if 0 > 0 then
    #find_max_in_list([], 0, fn(x, acc) -> x > acc end)
  #else
    #find_max_in_list([], 0, fn(x, acc) -> x > acc end)
  #end
  #if [] > 0 then
    #find_max_in_list([], 0, fn(x, acc) -> x > acc end)
  #else
    #find_max_in_list([], 0, fn(x, acc) -> x > acc end)
  #end

end
