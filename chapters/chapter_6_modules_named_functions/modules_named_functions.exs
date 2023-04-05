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

defmodule MathClient do
  alias Math
  def double_and_square(x) do
    x |> Math.double() |> Math.square()
  end
end

defmodule Example do

  @author "Dave Thomas"

    def get_author do
      @author
    end
  end

IO.puts "Example was written by #{Example.get_author}"

defmodule Example do

  @attr "one"

  def first, do: @attr

  @attr "two"

  def second, do: @attr
end

IO.puts "#{Example.second} #{Example.first}" # => "two one"

end
