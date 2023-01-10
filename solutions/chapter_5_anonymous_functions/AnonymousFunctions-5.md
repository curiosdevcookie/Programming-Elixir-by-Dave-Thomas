# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 5. Anonymous Functions • 50, Exercise: Functions-5

```elixir
iex(15)> map = Enum.map [1,2,3,4], fn x -> x + 2 end
[3, 4, 5, 6]
iex(16)> map2 = Enum.map([1,2,3,4], &(&1 + 2))
[3, 4, 5, 6]
```

```elixir
iex(17)> each = Enum.each [1,2,3,4], fn x -> IO.inspect x end
1
2
3
4
:ok
iex(18)> each2 = Enum.each([1,2,3,4], &(IO.inspect &1))
1
2
3
4
:ok
````
