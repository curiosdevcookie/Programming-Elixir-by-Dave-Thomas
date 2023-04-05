defmodule Times do
  alias Times # This is not necessary, but it is good practice.

  IO.puts "Hello, world!"

  def add_2(x) do
    x + 2
  end

  IO.puts(Times.add_2(5))


  # For elixir these functions are totally separate entities, because they have different arities (times/2, times/3):
  # This function is identified as times/2
  def times(x, y) do
    x * y
  end

  IO.puts(Times.times(2, 5))

  # This function is identified as times/3
  def times(x,y,z) do
    x * y * z
  end

  IO.puts(Times.times(2, 5, 10))


  # # This is a function with a default argument:
  def times_default(x, y, z \\ 1) do
    x * y * z
  end

  IO.puts(Times.times_default(2, 5))
  IO.puts(Times.times_default(2, 5, 10))

  # # This is a function with a guard clause:
  def times_guard(x, y, z) when z == 0 do
    x * y
  end

  IO.puts(Times.times_guard(2, 5, 0))

  # # This is a function with a guard clause:
  def times_guard2(x, y, z) when z != 0 do
    x * y * z
  end

  IO.puts(Times.times_guard2(2, 5, 10))



  # Exercise: ModulesAndFunctions-1

  def triple(x), do: x * 3

  IO.puts(Times.triple(5))

  # Exercise: ModulesAndFunctions-2
  # There is a compile-error due to the IO.puts calls. If I comment them out, compile, comment them back in, compile — it's fine. Why is that?

  # Exercise: ModulesAndFunctions-3

  def double(x) do
    x*2
  end

  def quadruple(x) do
  #  (x * 2) * 2
    double(x) * 2
  end
end
