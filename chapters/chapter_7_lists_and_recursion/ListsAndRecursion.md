# Lists and Recursion

## Heads and Tails

Earlier we said a list may either be empty or consist of a head and a tail. The head contains a value and the tail is itself a list. This is a recursive definition.

```elixir
iex(1)> head = 3
3
iex(2)> tail = [4, 5]
[4, 5]
iex(3)> newlist = [head | tail]
[3, 4, 5]
iex(4)> list1 = [2,3]
[2, 3]
iex(5)> list1 = [2 | [3|[]]]
[2, 3]
iex(9)> magiclist = [1 | [2 | [3 | []]]]
[1, 2, 3]
# pattern matching with lists:
iex(10)> [a, b, c] = [1, 2, 3]
[1, 2, 3]
# pattern matching with lists and the pipe operator:
iex(11)> [ head | tail ] = [ 1, 2, 3 ]
[1, 2, 3]
iex(12)> tail
[2, 3]
iex(13)> head
1
```

Elixir knows to deploy the pipe operator to the right of the list, so that the list is the first argument to the pipe operator. The pipe operator then passes the list to the function on the right, which in this case is the cons operator, `|`. The cons operator takes the head and the tail and returns a new list.

### Excursion: Representation of strings in Elixir

* `"cat"`
* [99, 97, 116] => (ASCII codes for "cat")

When elixir sees a list like [99,97,116] it doesn’t know if it is supposed to be the string 'cat' or a list of three numbers. So it uses a heuristic.
So, if all the values in a list represent printable characters, it displays the list as a string; otherwise it displays a list of integers.

[99,97,116,0] (=> [99,97,116,0]) is not a string as _0_ is not a printable character.

## Using Head and Tail to process a List

```elixir
defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + length(tail)
end
```

## Using Head and Tail to build a List
  
  ```elixir
  defmodule MyNewList do
    def square([]), do: []
      def square([head|tail]) do
      [head*head | square(tail)]
      end

    def add_1([]), do: []
    def add_1([head|tail]) do
      [head+1 | add_1(tail)]
    end
  end
  ```

## Creating a Map

We’ll define a function called map that takes a list and a function and returns a new list containing the result of applying that function to each element in the original.

```elixir
defmodule MyOwnMap do

  def map([], _fun), do: []
  def map([head|tail], fun) do
    [fun.(head) | map(tail, fun)]
  end
end

MyOwnMap.map([1,2,3], fn(x) -> x*x end)
MyOwnMap.map([1,2,3], &(&1*2))
```

## Reducing a List to a Single Value

We’ll define a function called reduce that takes a list, a function, and an initial value and returns a single value.

```elixir
defmodule MyOwnReduce do

  def reduce([], current_value, _fun), do: current_value
  def reduce([head|tail], current_value, fun) do
    reduce(tail, fun.(head, current_value), fun)
  end
end

#[1,2,3], 1, &(&1*&2)
MyOwnReduce.reduce([1,2,3], 1, fn(x, y) -> x*y end) # 15
MyOwnReduce.reduce([1,2,3], 1, &(&1*&2))# 15
MyOwnReduce.reduce([1,2,3], 0, &(&1*&2))# 0 (because 0 is the initial value)
```

## More Complex List Patterns

Elixir supports prepending multiple elements to a list using the | operator.

```zsh
iex(43)> [1,2,3 | [5,6]]
[1, 2, 3, 5, 6]
iex(22)> swappi=fn([a,b|tail]) -> [b,a|tail] end
#Function<42.3316493/1 in :erl_eval.expr/6>
iex(23)> swappi.([1,2,3,4,5,6])
[2, 1, 3, 4, 5, 6]
```

! This doesn't work:

```zsh
iex(24)> swappi_recursive=fn([a,b|tail]) -> [b,a|swappi_recursive.(tail)] end
#Function<somenumber/1 in :erl_eval.expr/6>
# Expected:
# swappi_recursive.([1,2,3,4,5,6])
# [2, 1, 4, 3, 6, 5]
# Actual:
# ** (CompileError) iex:24: undefined function swappi_recursive/0 (there is no such import)
```

### Lists of Lists

```elixir
defmodule WeatherHistoryOne do

  #[ timestamp, location_id, temperature, rainfall ]
  def for_location_27([]), do: []
  def for_location_27([time, 27, temp, rain ]| tail] do
    [[time, 27, temp, rain ]| for_location_27(tail)]
  end
  def for_location_27([_| tail]) do
    for_location_27(tail)
  end
  # Alternatively:
  # def for_location_27([time, _, temp, rain ]| tail] do
  #   for_location_27(tail)
  # end
end
```

This is a recurse until the list is empty stanza. Where we’d normally match into a variable called head, here the pattern is: `[time, 27, temp, rain ]` of the 2nd clause of our function `def for_location_27([time, 27, temp, rain ]| tail] do`. The cons operator (in Scala ::) is used to pass the tail to the function on the right, which is the function `for_location_27(tail)` and append the result to the list on the left, which is `[[time, 27, temp, rain ] | for_location_27(tail)]`.
For this to match, the head of the list must itself be a four-element list, and the second element of this sublist must be 27. If the second element is not 27, the function will not match, and the third clause will be used instead.
