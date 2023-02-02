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

Keyword lists are a special kind of list that are used to represent a collection of key-value pairs. They are often used to represent a set of options passed to a function.
They are also used to represent the metadata associated with a module. A keyword list is a list of two-element tuples, where the first element is an atom.

### Creating Keyword Lists

```zsh
iex> kwl = [one: 1, two: 2, three: 3]
[one: 1, two: 2, three: 3]
iex> kwl2 = [{:one, 1}, {:two, 2}, {:three, 3}]
[one: 1, two: 2, three: 3]
```

### Accessing Keyword Lists

Accessing a keyword list is similar to accessing a map. You can use the `[]` operator to retrieve the value associated with a key:

```zsh
iex> kwl[:one]
1
iex> kwl[:four]
nil
```

Map over the list of keywordlist values and return a list of values:

```zsh
iex> kwl = [one: 1, two: 2, three: 3]
[one: 1, two: 2, three: 3]
iex> Enum.map(kwl, fn {k, v} -> v end)
[1, 2, 3]
```

Map over the list of keywordlist keys and return a list of keys:
  
  ```zsh
  iex> kwl = [one: 1, two: 2, three: 3]
  [one: 1, two: 2, three: 3]
  iex> Enum.map(kwl, fn {k, v} -> k end)
  [:one, :two, :three]
  ```

### Keyword Lists and Pattern Matching

Keyword lists are often used to represent a set of options passed to a function. For example, the `File.read/1` function takes a keyword list of options. The `:encoding` option is used to specify the encoding of the file. If the `:encoding` option is not specified, the file is read as a binary.

```zsh
iex> File.read("test.txt")
{:ok, "Hello, world!"}
iex> File.read("test.txt", encoding: :utf8)
{:ok, "Hello, world!"}
iex> File.read("test.txt", encoding: :latin1)
{:ok, "Hello, world!"}
```

## Maps

Maps are the go-to key/value data structure in Elixir. They have good perfor- mance at all sizes.

### Creating Maps

```zsh
iex(22)> map = %{:one => 1, :two => 2, :three => 3}
%{one: 1, three: 3, two: 2}
```

### Accessing Maps

```zsh
iex(22)> map = %{:one => 1, :two => 2, :three => 3}
%{one: 1, three: 3, two: 2}
iex(23)> map[:one]
1
iex(24)> map[:four]
nil
iex(25)> Map.keys(map)
[:one, :three, :two]
iex(26)> Map.values(map)
[1, 3, 2]
```

### Updating Maps

```zsh
iex(27)> map2= %{ name: "Dave", likes: "Programming", where: "Dallas" }
%{likes: "Programming", name: "Dave", where: "Dallas"}
iex(28)> Map.put(map2, :name, "Dave Thomas")
%{likes: "Programming", name: "Dave Thomas", where: "Dallas"}
iex(29)> map3 = Map.drop(map2, [:where])
%{likes: "Programming", name: "Dave"}
iex(30)> Map.has_key?(map2,[:where])
false
iex(31)> Map.put(map3, :also_likes, "Food")
%{also_likes: "Food", likes: "Programming", name: "Dave"}
iex(35)> Map.pop(map3, :also_likes)
{nil, %{likes: "Programming", name: "Dave"}}
iex(36)> Map.drop(map3, [:nil])
%{likes: "Programming", name: "Dave"}
```

```zsh
iex(1)> person = %{ name: "Dave", height: 1.88 }
%{height: 1.88, name: "Dave"}
iex(2)> %{ name: a_name } = person
%{height: 1.88, name: "Dave"}
iex(3)> a_name
iex(4)> %{ name: _, height: _ } = person
%{height: 1.88, name: "Dave"}
#Destructuring is used to extract the height and name values, which is used to filter the results.
iex(5)> %{ name: "Dave" } = person
%{height: 1.88, name: "Dave"}
iex(6)> %{ name: _, weight: _ } = person
# ** (MatchError) no match of right hand side value: %{height: 1.88, name: "Dave"}
    # (stdlib 4.2) erl_eval.erl:496: :erl_eval.expr/6
    # iex:6: (file)
```

### Pattern Matching and Updating Maps

The question we most often ask of our maps is, “Do you have the following keys (and maybe values)?” If the answer is yes, we want to extract the values. If the answer is no, we want to do something else.

```zsh
    iex(1)> people = [
...(1)>       %{name: "Grumpy", height: 1.82},
...(1)>       %{name: "Dave", height: 1.78},
...(1)>       %{name: "Dopey", height: 1.27},
...(1)>       %{name: "Shaquille", height: 2.16},
...(1)>       %{name: "Sneezy", height: 1.28}
...(1)>     ]
[
  %{height: 1.82, name: "Grumpy"},
  %{height: 1.78, name: "Dave"},
  %{height: 1.27, name: "Dopey"},
  %{height: 2.16, name: "Shaquille"},
  %{height: 1.28, name: "Sneezy"}
]
iex(2)> for person = %{ height: needed_height} <- people, needed_height > 1.28, do: person
[
  %{height: 1.82, name: "Grumpy"},
  %{height: 1.78, name: "Dave"},
  %{height: 2.16, name: "Shaquille"}
]
iex(3)> for person = %{name: name_length} <- people, String.length(name_length) > 5, do: person
[
  %{height: 1.82, name: "Grumpy"},
  %{height: 2.16, name: "Shaquille"},
  %{height: 1.28, name: "Sneezy"}
]
```

### Pattern Matching Can’t Bind Keys
