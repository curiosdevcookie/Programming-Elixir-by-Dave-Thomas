# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 5. Anonymous Functions • 43, Exercise: Functions-1

```elixir
iex(13)> list1 = [:a, :b]
[:a, :b]
iex(14)> list2 = [:c, :d]
[:c, :d]
iex(15)> list_concat = fn (list1, list2) -> list1 ++ list2 end
#Function<41.3316493/2 in :erl_eval.expr/6>
iex(16)> list_concat.(list1, list2)
[:a, :b, :c, :d]
```

```elixir
iex(18)> sum = fn (a, b, c) -> a + b + c end
#Function<40.3316493/3 in :erl_eval.expr/6>
iex(19)> sum.(1,2,3)
6
```

```elixir
iex(24)> pair_tuple_to_list = fn(pair_tuple) -> [ pair_tuple ] end
#Function<42.3316493/1 in :erl_eval.expr/6>
iex(25)> pair_tuple_to_list.( { 1234, 5678 } )
[{1234, 5678}]
```

