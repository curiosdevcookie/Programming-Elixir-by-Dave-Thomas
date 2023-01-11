# Modules and Named Functions

You break your code into named functions and organize these functions into modules. Named functions in Elixir have to live in modules. You can then use the functions in other modules, or in the same module, by calling them by name.

## Named Functions

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
