# Basics

## Value Types

### (Arbitrary-sized) Integers

Integers in Elixir are represented in base 2, 8, 10, or 16. The base is determined by the prefix of the number:

* 0b prefix for binary
* 0o prefix for octal
* 0x prefix for hexadecimal
* … no prefix for decimal

```elixir
iex> 0b1010
10
iex> 0o777
511
iex> 0x1F
31
```

### Floating-Point Numbers

Floats in Elixir are represented with a decimal point. They are also called **double precision floating point numbers**.

```elixir
iex> 3.14
3.14
```

### Booleans and the Truth

Booleans in Elixir are represented with `true` and `false`. Another closely related value is `nil`, which represents the absence of a value and is considered `falsy`.

```elixir
iex> true
true
iex> false
false
```

### Atoms

An atom is a constant whose name is its value. Atoms are often used to represent things; for example, we can have the atom `:ok` to represent a successful operation, `:error` to represent an error, `:undefined` to represent that something is undefined, and so on.

We can use atoms to name modules and functions in Elixir. Atoms are also used in pattern matching.

**Note**: Atom names start with a colon (`:`).

```elixir
iex> :atom
:atom
```

**Note**: Atoms are not strings and are not surrounded by quotes. There is a special rule in Elixir where if you have a string that only contains letters, digits, underscores, and at signs, then Elixir will interpret it as an atom.

```elixir
iex> :"Elixir is fun"
:"Elixir is fun"
```

* :fred
* :is_binary?
* :var@2
* :<>
* :===
* :"func/3"
* :эликсир
* :mötley_crüe
* :Ελληνικά

### Ranges

A range is a set of values with a beginning and an end. Inclusive ranges are written with two dots between the beginning and end values.

```elixir
iex> 1..10
1..10
```

### Regular Expressions

Regular expressions in Elixir support the **PCRE** format.
They are written as ~r{regexp} or ~r{regexp}opts, or ~r/regexp/. Using the latter format has the disadvantage of having to escape any forward slashes within the pattern.

```elixir
iex> Regex.run ~r{[aeiou]}, "firlefanz"
["i"]
```

```elixir
iex> Regex.match? ~r{[aeiou]}, "firlefanz"
true
iex(138)> Regex.match? ~r{[i]}, "elixir"       
true
```

```elixir
iex> Regex.scan ~r{[aeiou]}, "firlefanz"
[["i"], ["e"], ["a"]]
```

```elixir
iex> Regex.replace ~r{[aeiou]}, "firlefanz", "#"
"f#r#l#f#nz"
```

```elixir
iex> Regex.split ~r{[aeiou]}, "firlefanz"
["f", "r", "l", "f", "nz"]
```

## System Types

### PIDs (Process Identifiers)

A PID is a unique identifier for a process. A port is a unique identifier for an external process.

```elixir
iex> self()
#PID<0.107.0>
```

### Ports

A port is a unique identifier for an external process.

```elixir
iex> port = Port.open({:spawn, "cat"}, [:binary])
#Port<0.3>
iex> send(port, {self(), {:command, "hello"}})
{#PID<0.120.0>, {:command, "hello"}}
iex> send(port, {self(), {:command, "world"}})
{#PID<0.120.0>, {:command, "world"}}
iex> Port.info(port)
[
  name: 'cat',
  links: [#PID<0.120.0>],
  id: 88,
  connected: #PID<0.120.0>,
  input: 10,
  output: 10,
  os_pid: 27507
]
iex> flush()
{#Port<0.3>, {:data, "hello"}}
{#Port<0.3>, {:data, "world"}}
:ok
iex> send(port, {self(), :close})
{#PID<0.120.0>, :close}
iex> flush()
{#Port<0.3>, :closed}
:ok
```

### References

A reference is a globally unique identifier for a message.

```elixir
iex> ref = make_ref()
#Reference<0.776971647.2957770754.158864>
```

## Collection Types

### Tuples

Tuples are created with braces and commas separating the values.
Tuples are ordered collections of values, they are the closest Elixir gets to a conventional array. Tuples are also used to return multiple values from functions. For example:

```elixir
iex> {1, 2, 3}
{1, 2, 3}


```elixir
iex> {1, 2, 3}
{1, 2, 3}
iex> {:ok, "hello"}
{:ok, "hello"}
```

Usually, tuples comprise 2—4 elements. If you need to store more elements, you should use Maps or Structs.

### Lists

Lists are created with brackets and commas separating the values.
Lists are ordered collections of values. Lists may include values of different types and they may include the same value multiple times. A list may either be empty or consist of a head and a tail. The head contains a value and the tail is itself a list. For example:

```elixir
iex> [1, 2, 3]
[1, 2, 3]
```

Lists are implemented as linked lists. This means that accessing the list head (the first element) is an operation that takes constant time. Accessing the list tail (the list without the first element) is an operation that takes linear time. This is why it is faster to prepend than to append to a list. For example:

```elixir
iex> list = [3, 2, 1]
[3, 2, 1]
iex> [0 | list]
[0, 3, 2, 1]
iex> list ++ [4, 5]
[3, 2, 1, 4, 5]
iex> 1 in list
true
```

### Keyword Lists

Keyword lists are lists of two-element tuples whose first element is an atom; they are often used to pass options to functions. Keyword lists are also used to represent the "rest" of a function call. For example:

```elixir
iex> [foo: "bar", hello: "world"]
[foo: "bar", hello: "world"]
iex> [{:foo, "bar"}, {:hello, "world"}]
[foo: "bar", hello: "world"]
```

Duplicate keys are allowed in keyword lists. Keyword lists are ordered, and the order of elements is preserved when new elements are added. For example:

```elixir
iex> [foo: "bar", hello: "world", foo: "baz"]
[foo: "bar", hello: "world", foo: "baz"]
```

### Maps

Maps are the go-to data structure in Elixir, they provide key-value storage with constant-time access. Maps are created with the %{} special form. For example:

```elixir
iex> map = %{:foo => "bar", "hello" => :world}
%{:foo => "bar", "hello" => :world}
iex> map[:foo]
"bar"
iex> map["hello"]
:world
iex> responses = %{ { :error, :enoent } => :fatal, { :error, :busy } => :retry }
iex> responses[{:error, :busy}]
:retry
```

If the keys of a Map are atoms, you can also use a dot notation:
  
  ```elixir
  iex> map = %{foo: "bar", hello: "world"}
  %{foo: "bar", hello: "world"}
  iex> map.hello
  "world"
  ```

Duplicate keys are not allowed in maps. If you try to add a duplicate key, the previous value is replaced with the new one:

```elixir
iex> map = %{foo: "bar", foo: "hello world"}
%{foo: "hello world"}
```

### Binaries and Bitstrings

Binaries are a bitstring with a binary size divisible by 8. Binaries are created with the <<>> special form. For example:

```elixir
iex> bitstring = <<1, 2, 3>>
<<1, 2, 3>>
iex> binary_bitstring = <<0b01010101, 0b10101010>>
<<85, 170>>
iex> hex_bitstring = <<0xAA, 0xBB>>
<<170, 187>>
```

### Dates and Times

Elixir provides a rich set of types to work with dates and times. The most important ones are:

* `Time` - a time of day without a date and without a time zone
* `Date` - a date without a time of day and without a time zone
* `NaiveDateTime` - a date and time without a time zone
* `DateTime` - a date and time with a time zone

For example:

```elixir
iex> time = Time.utc_now
~T[11:49:11.947816]
iex> date = Date.utc_today
~D[2023-01-10]
iex> naive_datetime = NaiveDateTime.utc_now
~N[2023-01-10 11:50:04.656630]
iex> datetime = DateTime.utc_now
~U[2023-01-10 11:50:19.958584Z]
iex> d1 = Date.new(2018, 1, 23)
~D[2018-01-23]
```

### Identifiers

Elixir identifiers must start with a letter or underscore, optionally followed by letters, digits, and underscores. Here letter means any UTF-8 letter character (optionally with a combining mark) and digit means a UTF-8 decimal-digit character.
The identifiers may end with a question mark or an exclamation mark. The question mark is used to denote a predicate function, and the exclamation mark is used to denote a function that mutates its receiver. Valid identifiers are, for example:

* адрес #valid
* my_little_🐴 #not valid
* my_little_pony #valid
* _42 #valid
* 42 #not valid
* _42_ #valid
* name·space #valid
* name•space #not valid

If the first character is an underscore, Elixir doesn’t report a warning if the variable is unused in a pattern match or function parameter list. This is useful for variables that are used only in guards. For example:

```elixir
iex> _ = 1
1
```

### Operators

#### Comparison operators

Comparison operators are used to compare two values. The result of a comparison is always a boolean. The comparison operators are:

* `==` - equal to
* `!=` - not equal to
* `===` - identical to
* `!==` - not identical to
* `<=` - less than or equal to
* `>=` - greater than or equal to
* `<` - less than
* `>` - greater than

The comparison uses natural ordering. Otherwise comparison is based on type according to this rule:
number < atom < reference < function < port < pid < tuple < map < list < binary

#### Boolean operators

Boolean operators are used to combine boolean values. The boolean operators are:

* a and b are true if both a and b are true, otherwise false (short-circuiting)
* a or b are true if either a or b are true, otherwise false (short-circuiting)
* not a is true if a is false, otherwise false

* a && b are true if both a and b are true, otherwise false (not short-circuiting)
* a || b are true if either a or b or both are true, otherwise false (not short-circuiting)
* !a is true if a is false, otherwise false

The difference between the two sets of operators is that the first set is short-circuiting, while the second set is not. Short-circuiting means that the right-hand side is not evaluated if the result can be determined from the left-hand side. For example:

```elixir
iex> true and raise "boom"
true
iex> false and raise "boom"
false
iex> true or raise "boom"
true
iex> false or raise "boom"
** (RuntimeError) boom
```

```elixir
iex> true && raise "boom"
** (RuntimeError) boom
iex> false && raise "boom"
false
iex> true || raise "boom"
true
iex> false || raise "boom"
** (RuntimeError) boom
```

```elixir
iex> true and 1 == 1
true
iex> false and 1 == 1
false
iex> true or 1 == 1
true
iex> false or 1 == 1
true
```

#### Arithmetic operators

Arithmetic operators are used to perform arithmetic operations on numbers. The arithmetic operators are:

* `+` - addition
* `-` - subtraction
* `*` - multiplication
* `/` - division
* `div` - integer division
* `rem` - remainder of integer division

The division operator `/` always returns a float. If you want to perform integer division, use the `div` operator. For example:

```elixir
iex(125)> 10/5
2.0
iex(126)> div(10, 5)
2
iex(127)> 10 |> div(5)
2
```

The `rem` operator returns the remainder of integer division. For example:

```elixir
iex(128)> rem(10, 5)
0
iex(129)> 10 |> rem(3)
1
```

#### Join operators

Join operators are used to join two elements. The join operators are:

* `<>`, binary1 <> binary2  - concatenation
* `++`, list1 ++ list2 - concatenation

The `<>` operator is used to concatenate binaries. For example:

```elixir
iex> "foo" <> "bar"
"foobar"
```

The `++` operator is used to concatenate lists. For example:

```elixir
iex> [1, 2] ++ [3, 4]
[1, 2, 3, 4]
```

#### The in operator

* `in`, a in enum — tests if a is included in enum (enums are lists, maps, ranges, or binaries(?))

The `in` operator is used to check if a value is in a collection. For example:

```elixir
iex> 1 in [1, 2, 3]
true
iex> 1 in [2, 3, 4]
false
iex> 1 in 1..10
true
iex> 1 in 2..10
false
iex> "e" in "elixir"
** (Protocol.UndefinedError) protocol Enumerable not implemented for "elixir" of type BitString
iex(138)> Regex.match? ~r{[e]}, "elixir"
true
```

### Variable Scope

Elixir has lexical scope. This means that variables are visible only within the scope in which they are defined. For example:

```elixir
iex> x = 1
1
iex> if true do
...> x = 2
...> end
2
iex> x
1
iex(144)> if true do
...(144)> y=2
...(144)> end
2
iex(145)> y
warning: variable "y" does not exist.
```

Do-block Scope: The variable `y` is visible only within the `if` expression. If we try to access it outside the `if` expression, we get an error.

Best practice in variables to be safe:

Instead of:

```elixir
case integer do
      1 -> atom = :one
      2 -> atom = :two
end
```

write the following:

```elixir
atom =
  case integer do
1 -> :one
2 -> :two
end
```

### The with Expression

The with expression allows us to chain multiple expressions together. If any of the expressions fail, the whole with expression fails. For example:

```elixir
iex> with {:ok, result} <- {:ok, 13}, do: result * 2
26
````

```elixir
iex(153)> with [a|_] <- [1,2,3], do: a
1
iex(154)> with [a|_] <- nil, do: a
nil
```
