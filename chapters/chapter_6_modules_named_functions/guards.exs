defmodule Guards do

def what_is(x) when is_number(x) do
  IO.puts "#{x} is a number"
end

def what_is(x) when is_atom(x) do
  IO.puts "#{x} is an atom"
end

def what_is(x) when is_list(x) do
  IO.puts "#{x} is a list"
end

Guards.what_is(94)
Guards.what_is(:hello)
Guards.what_is([1, 2, 3, 4, 5])
Guards.what_is(["a", "b", "c", "d", "e"])

end
