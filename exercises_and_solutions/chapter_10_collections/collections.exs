# Fun things to do with the ENUM module:

# 1. Create a list of numbers from 1 to 100
our_list = Enum.to_list(1..100)

# 2. Filter out all the odd numbers
filtered_list = Enum.filter(our_list, fn x -> rem(x, 2) == 0 end)

# 3. Double the remaining numbers
filtered_doubled = Enum.map(filtered_list, fn x -> x * 2 end)

# 4. Drop every 5th element
filtered_doubled_dropped = Enum.drop_every(filtered_doubled, 5)

# 5. Shuffle the numbers
filtered_doubled_dropped_shuffled = Enum.shuffle(filtered_doubled_dropped)

# 6. Concat the numbers with a different collection
concat = Enum.concat(filtered_doubled_dropped_shuffled, Enum.to_list(1..3))

# 7. Create sublists with three members each and one sublist of the rest
concatted_three = Enum.chunk_every(concat, 3)

# 8. Diversify the list by adding a member in-between
concatted_three_interspersed = Enum.intersperse(concatted_three, "✳️")

# 9. Count the number of times each member appears in the list
Enum.frequencies_by(concatted_three_interspersed, fn x -> x == "✳️" end)

# 10. Remove all "✳️" from the list
starless = Enum.reject(concatted_three_interspersed, fn x -> x == "✳️" end)

# 11. Flatten the list
starless_flattened = Enum.flat_map(concatted_three_interspersed, fn x -> x end)

# 12. Select every nth element
Enum.map_every(starless_flattened, 2, fn x -> x * 2 end)

# 13. Return the minimum and maximum elements
starless_flattened_minmax = Enum.min_max(starless_flattened)

# 14. Return the first and last elements
[1, 2, 3, 4, 5] |> Enum.take(1)
[1, 2, 3, 4, 5] |> Enum.take(-1)

# 15. Filter for odd and for even
# ❗️ iex(1)> require Integer
[1, 2, 3, 4, 5] |> Enum.filter(&Integer.is_even/1)
[1, 2, 3, 4, 5] |> Enum.filter(&Integer.is_odd/1)

# 16. Reject odd numbers
[1, 2, 3, 4, 5] |> Enum.reject(&Integer.is_odd/1)
## [2, 4]

# 17. Return elements that match the condition is_even and are smaller than 5
[1, 2, 3, 4, 5] |> Enum.filter(&Integer.is_even/1) |> Enum.filter(fn x -> x < 5 end)

# 18. Return the first element that matches the condition is_even
[1, 2, 3, 4, 5] |> Enum.find(&Integer.is_even/1)

# 19. Sorting the elements of a list
[5, 3, 2, 1, 4] |> Enum.sort()
## [1, 2, 3, 4, 5]

# 20. Returning the max element
["once", "upon", "a", "time", "in", "the", "west"] |> Enum.max()
## "west"

["once", "upon", "a", "time", "in", "the", "west"] |> Enum.max_by(&String.length/1)
## "once"

# 21. Returning the min element
["once", "upon", "a", "time", "in", "the", "west"] |> Enum.min()

# 22. Return min and max elements
["once", "upon", "a", "time", "in", "the", "west"] |> Enum.min_max_by(&String.length/1)
## {"a", "once"}

# 23. Splitting
[1, 2, 3, 4, 5, 6, 7, 8, 9] |> Enum.split(3)
## {[1, 2, 3], [4, 5, 6, 7, 8, 9]}
[1, 2, 3, 4, 5, 6, 7, 8, 9] |> Enum.split_while(fn x -> x < 7 end)
## {[1, 2, 3, 4, 5, 6], '\a\b\t'}

# 24. Grouping
[1, 2, 3, 4, 5, 6, 7, 8, 9] |> Enum.group_by(fn x -> rem(x, 3) end)
## %{0 => [3, 6, 9], 1 => [1, 4, 7], 2 => [2, 5, 8]}

# 25. Counting
[1, 2, 3, 4, 5, 6, 7, 8, 9] |> Enum.count(fn x -> rem(x, 3) == 0 end)
## 3

# 26. Predicate operations
[1, 2, 3, 4, 5] |> Enum.all?(fn x -> x > 0 end)
## true

[1, 2, 3, 4, 5] |> Enum.member?(6)
## false

# 27. Fold elements into a single value
[1, 2, 3, 4, 5] |> Enum.reduce(fn x, acc -> x + acc end)
## 15

["once", "upon", "a", "time", "in", "the", "west"]
|> Enum.reduce(fn x, acc ->
  if String.length(x) > String.length(acc) do
    x
  else
    acc
  end
end)

## once

["once", "upon", "a", "time", "in", "the", "west"]
|> Enum.reduce(fn x, acc -> if String.length(x) > String.length(acc), do: x, else: acc end)

["once", "upon", "a", "time", "in", "the", "west"]
|> Enum.reduce(fn word, longest ->
  if String.length(word) > String.length(longest), do: word, else: longest
end)

## once

# STREAMS

# 1. Create a stream
["once", "upon", "a", "time", "in", "the", "west"]
|> Stream.into([], fn x -> x end)

## #Function<46.124013645/2 in Stream.into/3>

Stream.iterate(5, &(&1 + 1)) |> Enum.take(5)
## [5, 6, 7, 8, 9]

# 2. Pour stream into a list
["once", "upon", "a", "time", "in", "the", "west"]
|> Stream.into([], fn x -> x end)
|> Enum.to_list()

## ["once", "upon", "a", "time", "in", "the", "west"]

# 3. Do a lot of stuff before pouring the stream into a list:
[1, 2, 3, 4]
|> Stream.map(&(&1 * &1))
|> Stream.map(&(&1 + 1))
|> Stream.filter(fn x -> rem(x, 2) == 1 end)
|> Enum.to_list()

## [5, 17]

Enum.map(1..10_000_000, fn x -> x + 1 end) |> Enum.take(5)
## [2, 3, 4, 5, 6] (takes a few seconds to complete)

Stream.map(1..10_000_000, fn x -> x + 1 end) |> Enum.take(5)
## [2, 3, 4, 5, 6] (takes a few milliseconds to complete)
## The take call just needs five values, which it gets from the stream. Once it has them, there’s no more processing.

# 4. Infinite streams

# Stream.cycle:
# Stream.cycle takes an enumerable and returns an infinite stream containing that enumerable’s elements.
Stream.cycle([1, 2, 3]) |> Enum.take(10)
## [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]

# Create rows of html for a table with a stream cycle:
Stream.cycle(~w{ green white })
|> Stream.zip(1..19)
|> Enum.map(fn {class, value} -> "<tr class='#{class}'><td>#{value}</td></tr>\n" end)
|> IO.puts()

# Stream.repeatedly:
# Stream.repeatedly takes a function and invokes it each time a new value is wanted.
Stream.repeatedly(fn -> :rand.uniform(100) end) |> Enum.take(10)
## [88, 48, 14, 17, 39, 62, 98, 86, 7, 65]

Stream.repeatedly(fn -> "honey" end) |> Enum.take(10)
## ["honey", "honey", "honey", "honey", "honey", "honey", "honey", "honey", "honey", "honey"]

# Stream.iterate:
# Stream.iterate(start_value, next_fun) generates an infinite stream. The first value is start_value. The next value is generated by applying next_fun to this value. This continues for as long as the stream is being used, with each value being the result of applying next_fun to the previous value.
Stream.iterate(2, &(&1 * &1)) |> Enum.take(5)
## [2, 4, 16, 256, 65536]

# Stream.unfold
# Stream.unfold(seed, next_fun) generates an infinite stream. The first value is seed. The next value is generated by applying next_fun to this value. This continues for as long as the stream is being used, with each value being the result of applying next_fun to the previous value.
Stream.unfold(2, fn x -> {x, x * x} end) |> Enum.take(5)
## [2, 4, 16, 256, 65536]
Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1 + f2}} end) |> Enum.take(15)
## [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]
# Here the state is a tuple containing the current and the next number in the sequence. We seed it with the initial state of {0, 1}. The value each iteration of the stream returns is the first of the state values. The new state moves one down the sequence, so an initial state of {f1,f2} becomes a new state of {f2,f1+f2}.#

# Stream.resource
# Stream.resource builds upon Stream.unfold. It makes two changes.
# The first argument to unfold is the initial value to be passed to the iteration function. But if that value is a resource, we don’t want to open it until the stream starts delivering values, and that might not happen until long after we create the stream. To get around this, resource takes not a value, but a function that returns the value. That’s the first change.
# Second, when the stream is done with the resource, we may need to close it. That’s what the third argument to Stream.resource does—it takes the final accumulator value and does whatever is needed to deallocate the resource.

Stream.resource(
  fn -> File.open!("../../test_text_file.txt") end,
  fn file ->
    case IO.read(file, :line) do
      data when is_binary(data) -> {[data], file}
      _ -> {:halt, file}
    end
  end,
  fn file -> IO.close(file) end
)

## #Function<52.124013645/2 in Stream.resource/3>

# 5. Stream composition

concat = Stream.concat(1..3, 4..6)

Enum.to_list(concat)
# [1, 2, 3, 4, 5, 6]

# COMPREHENSIONS

# 1. Basic comprehension
result =
  for x <- 1..10,
      do: x * x

## [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

# 2. Comprehension with filters

result =
  for x <- 1..10,
      rem(x, 2) == 0,
      do: x * x

## [4, 16, 36, 64, 100]

# 3. Comprehension with multiple generators
result =
  for x <- 2..3,
      y <- 4..5,
      do: x * y

## [8, 10, 12, 15]

first9 = [1, 2, 3, 4, 5, 6, 7, 8, 9]

for x <- first9,
    y <- first9,
    x < y,
    do: {x, y}

first8 = [1, 2, 3, 4, 5, 6, 7, 8]

for x <- first8, y <- first8, x >= y, rem(x * y, 10) == 0, do: {x, y}
## [{5, 2}, {5, 4}, {6, 5}, {8, 5}]

for <<ch <- "hello">>, do: ch
## 'hello'

for <<ch <- "hello ">>, do: <<ch>>
## ["h", "e", "l", "l", "o", " "] (list of binaries)

for <<ch <- "hello">>, do: <<ch::utf8>>
## ["h", "e", "l", "l", "o"]

for <<(<<b1::size(2), b2::size(3), b3::size(3)>> <- "hello")>>,
  do: "0#{b1}#{b2}#{b3}"

## ["0150", "0145", "0154", "0154", "0157"]
