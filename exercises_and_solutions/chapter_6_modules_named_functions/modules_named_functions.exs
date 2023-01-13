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

# This is a function with a default argument:
  def greet_default(greeting, name, punctuation \\ "!") do
    IO.puts greeting
    IO.puts "There you are, #{name}#{punctuation}"
  end

  # This is a function with a guard clause:
  def greet_guard(greeting, name, punctuation) when punctuation == "!" do
    IO.puts greeting
    IO.puts "There you are, #{name}#{punctuation}"
  end

end
