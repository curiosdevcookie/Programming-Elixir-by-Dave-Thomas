# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 5. Anonymous Functions • 47, Exercise: Functions-4

```elixir
iex(51)> string = "Mrs."
"Mrs."
iex(52)> string2 = "Smith"
"Smith"
iex(53)> prefix = fn(string) -> (fn (string2)-> "#{string} #{string2}" end) end
#Function<42.3316493/1 in :erl_eval.expr/6>
iex(54)> prefix.(string).(string2)
"Mrs. Smith"
iex(55)> string = "Hello"
"Hello"
iex(56)> string2 = "World"
"World"
iex(57)> prefix.(string).(string2)
"Hello World"
```
