# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 5. Anonymous Functions • 45, Exercise: Functions-2

```elixir
iex(8)> fizzbuzz = fn
...(8)> (0,_,_) -> "Fizz"
...(8)> (_,0,_) -> "Buzz"
...(8)> (0,0,_) -> "FizzBuzz"
...(8)> end
#Function<40.3316493/3 in :erl_eval.expr/6>
iex(9)> fizzbuzz.(0, 0, 1)
"Fizz"
iex(10)> fizzbuzz.(1, 0, 0)
"Buzz"
iex(11)> fizzbuzz.(0, 0, 1)
"Fizz"
````
