defmodule Swapper do

  def swappi([]), do: []
  def swappi([a,b|tail]) do
    [b,a|tail]
  end

  IO.puts(Swapper.swappi([1,2,3,4,5])) # [2,1,3,4,5]

  def swappi2([]), do: []
  def swappi2([a,b,c|tail]) do
    [c,b,a|tail]
  end

  IO.puts(Swapper.swappi2([1,2,3,4,5])) # [3,2,1,4,5]

  def swappi_recursive([]), do: []
  def swappi_recursive(_), do: raise "Can't swap a list with an odd number of elements! It happens …"
  def swappi_recursive([a,b|tail]) do
    [b,a|swappi_recursive(tail)]
  end

IO.puts(Swapper.swappi_recursive([1,2,3,4,5,6])) # [2,1,4,3,6,5]
IO.puts(Swapper.swappi_recursive([1,2,3,4,5]))
# ** (RuntimeError) Can't swap a list with an odd number of elements! It happens …
end
