# Maps, Keyword Lists, Sets, and Structs

## Choosing between Maps, Structs, and Keyword Lists

*1.* Do I want to pattern-match against the contents (for example, matching
a dictionary that has a key of :name somewhere in it)?

  > If so, use a map.

*2.* Will I want more than one entry with the same key?

  > If so, you’ll have to use the Keyword module.

*3.* Do I need to guarantee the elements are ordered?

  > If so, again, use the Keyword module.

*4.* Do I have a fixed set of fields (that is, is the structure of the data always
the same)?

  > If so, use a struct.

*5.* Otherwise, if you’ve reached this point,

  > Use a map.

## Keyword Lists

Keyword lists are a special kind of list that are used to represent a collection of key-value pairs. They are often used to represent a set of options passed to a function. Keyword lists are also used to represent the metadata associated with a module.

### Creating Keyword Lists

```elixir
iex> kwl = [one: 1, two: 2, three: 3]
[one: 1, two: 2, three: 3]
iex> kwl2 = [{:one, 1}, {:two, 2}, {:three, 3}]
[one: 1, two: 2, three: 3]
```

### Accessing Keyword Lists

```elixir
iex> kwl[:one]
1
iex> kwl[:four]
nil
```