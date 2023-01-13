# Modules and Named Functions

You break your code into named functions and organize these functions into modules. Named functions in Elixir have to live in modules. You can then use the functions in other modules, or in the same module, by calling them by name.

## Named Functions

Named functions are defined with the `def` keyword. The `def` keyword is followed by the name of the function, a list of arguments, and the body of the function. The body of the function is defined with the `do` keyword.

```elixir

```elixir
def double(x) do
  x * 2
end
```

…is the same as…

```elixir
def double(x), do: x * 2
```

This also works for passing multiple lines to "do":

```elixir
def greet(greeting, name), do: (
IO.puts greeting
IO.puts "There you are, #{name}!"
)
```

The do...end form is just a lump of syntactic sugar—during compilation it is turned into the do: form. (And the do: form itself is nothing special; it is simply a term in a keyword list.)

## Guard Clauses

* Comparison Operators: ==, !=, ===, !==, >, <, <=, >=

* Boolean Operator: or, and, not, ! (not allowed are || and &&)

* Arithmetic Operators: +, -, *, /

* Join Operators: <>, ++ as long as the left operand is a literal

* Type-check Operators: is_atom, is_binary, is_bitstring, is_boolean, is_float, is_function, is_integer, is_list, is_map, is_nil, is_number, is_pid, is_port, is_reference, is_tuple

* Special Operators: in

* Other Functions: e.g. div(number,number), hd(list)/tl(list), rem(number,number)

## The Pipe operator

The pipe operator `|>` takes the result of one expression and passes it as the first argument to the next expression. It is a way to chain functions together. For example, the following code:

```elixir


```elixir
defmodule Pipe do
  def double(x), do: x * 2
  def square(x), do: x * x
  def double_and_square(x), do: x |> double() |> square()
end
```

## Modules

Modules are the primary way to organize code in Elixir. They are a container for named functions. Modules are defined with the `defmodule` keyword.

```elixir
defmodule Math do
  def double(x) do
    x * 2
  end
end
```

Modules can be nested:

```elixir
defmodule Math do
  defmodule Geometry do
    def area(x, y) do
      x * y
    end
  end
end
```

Modules can be defined in a file with the same name as the module. The file should be in the `lib` directory of your project. For example, the `Math` module defined above should be in `lib/math.ex`.

## Calling Functions

To call a function, you use the module name followed by a dot and the function name. For example, to call the `double` function in the `Math` module, you would write `Math.double(2)`.

## Importing Functions

You can import functions from other modules into the current module with the `import` keyword. This allows you to call the functions without using the module name.

```elixir
defmodule Math do
  def double(x) do
    x * 2
  end

  def square(x) do
    x * x
  end
end

defmodule MathClient do
  import Math
  def double_and_square(x) do
    x |> double() |> square()
  end
end
```

## Aliasing Modules

You can alias modules with the `alias` keyword. This allows you to call the functions without using the module name.

```elixir
defmodule Math do
  def double(x) do
    x * 2
  end

  def square(x) do
    x * x
  end
end

defmodule MathClient do
  alias Math
  def double_and_square(x) do
    x |> Math.double() |> Math.square()
  end
end
```
