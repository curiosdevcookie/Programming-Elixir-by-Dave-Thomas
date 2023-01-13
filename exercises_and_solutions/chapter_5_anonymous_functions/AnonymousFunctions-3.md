# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 5. Anonymous Functions • 45, Exercise: Functions-3

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
iex(31)> fizzbuzz_helper = fn(x) -> fizzbuzz.(rem(x,3), rem(x,5), x) end
#Function<42.3316493/1 in :erl_eval.expr/6>
iex(32)> fizzbuzz_helper.(10)                                           
"Buzz"
iex(33)> fizzbuzz_helper.(11)
11
iex(34)> fizzbuzz_helper.(12)
"Fizz"
iex(35)> fizzbuzz_helper.(13)
13
iex(36)> fizzbuzz_helper.(14)
14
iex(37)> fizzbuzz_helper.(15)
"Fizz"
iex(38)> fizzbuzz_helper.(16)
16
```

fizzbuzz = fn
(0,_,_) -> "Fizz"
(_,0,_) -> "Buzz"
(0,0,_) -> "FizzBuzz"
(_,_,c) -> c
end

fizzbuzz.(0,0,0)
