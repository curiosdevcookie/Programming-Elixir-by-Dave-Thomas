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

### Pattern Matching Can’t Bind Values to Keys

When pattern matching, we can't bind a value to a key. The following code will not work:

```zsh
iex(18)> %{item => :ok } = %{ 1 => :ok, 2 => :error }
# ** (CompileError) iex:18: cannot use variable item as map key inside a pattern. Map keys in patterns can only be literals (such as atoms, strings, tuples, and the like) or an existing variable matched with the pin operator (such as ^some_var)
````

This will work:

```zsh
iex(18)> %{ 2 => state } = %{ 1 => :ok, 2 => :error }
%{1 => :ok, 2 => :error}
iex(19)> state
:error
```

Also, pattern matching can bind variables already in a variable on the left-hand side of a match with the pin operator:

```zsh
iex(20)> item = 1
1
iex(21)> %{^item => :ok } = %{ 1 => :ok, 2 => :error}
%{1 => :ok, 2 => :error}
```

// Example with a map and a for-loop:

```zsh
iex(22)> data = %{ name: "Dave", state: "TX", likes: "Elixir" }
%{likes: "Elixir", name: "Dave", state: "TX"}
iex(23)> for key <- [:name, :likes] do
...(23)> %{^key => value} = data
...(23)> value
...(23)> end
["Dave", "Elixir"]
```

## Updating a Map

In elixir we can update already exististing entries (key/value pairs) of maps or add new entries to maps without traversing the whole map!! Keep in mind however that the map is immutable and that the update operation returns a new map.

To update existing entries:

* new_map = %{old_map | key => value} // Updates the value of its key in old_map
* new_map = Map.update!(old_map, key, fun) // Evaluates fun and updates the value of its key in old_map

```zsh
iex(30)> map = %{ name: "Dave", likes: "Programming", where: "Dallas" }
%{likes: "Programming", name: "Dave", where: "Dallas"}
iex(31)> map = %{ map | name: "Carla"}
%{likes: "Programming", name: "Carla", where: "Dallas"}
iex(32)> map = Map.update!(map, :likes, fn _ -> "Elixir" end)
%{likes: "Elixir", name: "Carla", where: "Dallas"}
iex(33)> map = Map.update!(map, :likes, fn  -> "Fun" end)       
# ** (FunctionClauseError) no function clause matching in Map.update!/3    
iex(34)> map = Map.update!(map, :likes, fn _  -> "Fun" end)
%{likes: "Fun", name: "Carla", sun: "is shining", where: "Dallas"}
```

To add new entries to a map, we can use:

* `Map.put/3` = Map.put(map, key, value) // Puts the given value under key in a map
* `Map.put_new/3` = Map.put_new(map, key, value) // Puts the given value under key in a map unless the entry key already exists in the map
* `Map.put_new_lazy/3` = Map.put_new_lazy(map, key, fun) // Evaluates fun and puts the result under key in map unless key is already present.

```zsh
iex(25)> map = %{ name: "Dave", likes: "Programming", where: "Dallas" }
%{likes: "Programming", name: "Dave", where: "Dallas"}
iex(26)> map = Map.put(map, :sun, "is shining")
%{likes: "Programming", name: "Dave", sun: "is shining", where: "Dallas"}
iex(27)> map = Map.put_new(map, :sun, "is shining")
%{likes: "Programming", name: "Dave", sun: "is shining", where: "Dallas"}
iex(28)> map = Map.put_new_lazy(map, :sun, fn -> "is shining" end)
%{likes: "Programming", name: "Dave", sun: "is shining", where: "Dallas"}
```
