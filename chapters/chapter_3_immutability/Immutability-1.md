# Immutability

```code
iex(1)> list = [1,2,3]
[1, 2, 3]
iex(2)> Enum.map(list, fn x -> x + 1 end)
[2, 3, 4]
iex(3)> list
[1, 2, 3]
iex(4)> v(1)
[1, 2, 3]
iex(5)> v(2)
[2, 3, 4]
iex(6)> list = Enum.map(list, fn x -> x + 1 end)
[2, 3, 4]
iex(7)> list
[2, 3, 4]
iex(8)> Enum.member?(list, 4)
true
```

```code
iex(1)> list = [1,2,3]
[1, 2, 3]
iex(2)> list2=Enum.map(list, fn x -> x + 1 end)
[2, 3, 4]
iex(3)> list
[1, 2, 3]
iex(4)> list2
[2, 3, 4]
iex(5)> list2 = list
[1, 2, 3]
iex(6)> list2
[1, 2, 3]
iex(7)> list
[1, 2, 3]
iex(8)> list2 = list ++ [4]
[1, 2, 3, 4]
iex(9)> list
[1, 2, 3]
iex(10)> list2
[1, 2, 3, 4]
iex(11)> list -- [3]
[1, 2]
iex(12)> list
[1, 2, 3]
iex(16)> [0 | list]
[0, 1, 2, 3]
iex(17)> list
[1, 2, 3]
```

```code
iex(2)> string = "elixir"
"elixir"
iex(3)> defmodule Immutable do
...(3)> def capitalize_second(string) do
...(3)>     String.slice(string, 0, 1) <> String.capitalize(String.slice(string, 1, 1)) <> String.slice(string, 2..-1)
...(3)>   end
...(3)> end
{:module, Immutable,
 <<70, 79, 82, 49, 0, 0, 7, 56, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 234,
   0, 0, 0, 23, 16, 69, 108, 105, 120, 105, 114, 46, 73, 109, 109, 117, 116,
   97, 98, 108, 101, 8, 95, 95, 105, 110, 102, ...>>, {:capitalize_second, 1}}
iex(4)> Immutable.capitalize_second(string)
"eLixir"
iex(5)> string
```
