# Modules and Named Functions

defmodule NamedFunctions do
  alias NamedFunctions


  def greet(greeting, name) do
    IO.puts greeting
    IO.puts "There you are, #{name}!"
  end

  def greet2(greeting, name), do: (
  IO.puts greeting
  IO.puts "There you are, #{name}!"
)

end
