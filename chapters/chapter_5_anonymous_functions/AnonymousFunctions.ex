# Fizzbuzz without conditionals
fizzbuzz = fn
(0,_,_) -> "Fizz"
(_,0,_) -> "Buzz"
(0,0,_) -> "FizzBuzz"
(_,_,c) -> c
end

fizzbuzz.(0,0,0)

fizzbuzz_helper = fn(x) -> fizzbuzz.(rem(x,3), rem(x,5), x) end

fizzbuzz_helper.(10) # => "Buzz"
fizzbuzz_helper.(11) # => 11
fizzbuzz_helper.(12) # => "Fizz"
fizzbuzz_helper.(13) # => 13
fizzbuzz_helper.(14) # => 14
fizzbuzz_helper.(15) # => "FizzBuzz"
fizzbuzz_helper.(16) # => 16


# Functions Can Return Functions:

fun1 = fn() -> fn() -> "Hello" end end
fun1.().() # => "Hello"
fun1.() # => #Function<20.99386804/0 in :erl_eval.expr/5>

other = fun1.()
other.() # => "Hello"

fun2 = fn() -> fn(x) -> x end end
fun2.().(10) # => 10

# Functions remember their environment, so they can be used to create closures:

greeter = fn(name) -> fn() -> "Hello, #{name}" end end # => #Function<42.3316493/1 in :erl_eval.expr/6>
greeter.("Dave") # => #Function<42.3316493/0 in :erl_eval.expr/6>
greeter_dave = greeter.("Dave") # => #Function<42.3316493/0 in :erl_eval.expr/6>
greeter_dave.() # => "Hello, Dave"

# Parameterized Functions:

add_n = fn(n) -> (fn(x) -> x + n end) end
add_n.(10).(20) # => 30
add_10 = add_n.(10)
add_20 = add_n.(20)
add_10.(20) # => 30
add_20.(20) # => 40

#Higher Order Functions/First-Class Citizens:


times_2 = fn(n) -> n * 2 end
apply = fn(f, x) -> f.(x) end
apply.(times_2, 10) # => 20

list = [1, 3, 5, 7, 9]

Enum.map([1, 3, 5, 7, 9], fn(x) -> x * 2 end) # => [2, 6, 10, 14, 18]

Enum.map(list, times_2) # => [2, 6, 10, 14, 18]

list |> Enum.map(times_2) # => [2, 6, 10, 14, 18]


Enum.map(list, fn(x)-> x>5 end) # => [false, false, false, true, true]


# The & Notation:

add_one = fn(x) -> x+1 end # same as add_one = &(&1 + 1)
add_one.(10) # => 11

speak = &(1 + 1) # same as speak = fn() -> 1 + 1 end
speak.() # => 2

tell = &(IO.puts(&1)) # same as tell = fn(x) -> IO.puts(x) end
tell.("Hello") # => Hello

add = fn(a,b) -> a+b end # same as add = &(&1 +&2)
add.(1,2) # => 3
add2 = &(&1 +&2)
add2.(1,2) # => 3
