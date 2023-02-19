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

### Updating a Map

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

## Structs

A struct is just a module that wraps a limited form of map. It’s limited because the keys must be atoms and because these maps don’t have Dict capabilities. The name of the module becomes the name of the map type. Inside the module, you use the defstruct macro to define the struct’s members:

```zsh
iex(1)> c("defstruct.exs")
[Subscriber]
iex(2)> s1 = %Subscriber{}
%Subscriber{name: "", paid: false, over_18: true}
iex(3)> s2 = %Subscriber{name: "Clara"}
%Subscriber{name: "Clara", paid: false, over_18: true}
iex(4)> s3 = %Subscriber{name: "Clara", paid: false}
%Subscriber{name: "Clara", paid: false, over_18: true}
iex(5)> s2
%Subscriber{name: "Clara", paid: false, over_18: true}
```

The syntax for creating a struct is the same as the syntax for creating a map—you simply add the module name between the % and the { and you access the struct’s members with the dot operator or pattern matching:

```zsh
iex(10)> s2.name
"Clara"
iex(11)> %Subscriber{name: a_name} = s2
%Subscriber{name: "Clara", paid: false, over_18: true}
iex(12)> a_name
"Clara"
iex(13)> s3.paid
false
iex(14)> %Subscriber{paid: paid}=s3
%Subscriber{name: "Clara", paid: false, over_18: true}
# and updating a Struct:
iex(15)> %Subscriber{s3 | name: "Gordon"}
%Subscriber{name: "Gordon", paid: false, over_18: true}
iex(16)> %Subscriber{s3 | paid: "false"}
%Subscriber{name: "Clara", paid: "false", over_18: true}
iex(17)> %Subscriber{s3 | paid: "false", name: "Cameron"}
%Subscriber{name: "Cameron", paid: "false", over_18: true}
```

Why are structs wrapped in a module? The idea is that you are likely to want to add struct-specific behavior. For example, you might want to add a function that takes a struct as an argument and returns a string that describes the struct. You can do this by defining a function in the module that wraps the struct:

```zsh
iex(19)> %Attendee{}
%Attendee{name: "", paid: false, over_18: true}
iex(20)> a1 = %Attendee{name: "Cameron", over_18: false} 
%Attendee{name: "Cameron", paid: false, over_18: false}
iex(21)> a2 = %Attendee{name: "Gordon", over_18: true}
%Attendee{name: "Gordon", paid: false, over_18: true}
iex(22)> a3 = %Attendee{name: "Clara", paid: true, over_18: true}
%Attendee{name: "Clara", paid: true, over_18: true}
iex(23)> Attendee.may_attend_after_party(a1)     
false
iex(24)> Attendee.may_attend_after_party(a2)
false
iex(25)> Attendee.may_attend_after_party(a3)                     
true
iex(26)> Attendee.print_vip_badge(a1)                            
Very cheap badge for Cameron
iex(28)> a4 = %Attendee{name: "", over_18: true}                 
%Attendee{name: "", paid: false, over_18: true}
iex(29)> Attendee.print_vip_badge(a4)           
** (RuntimeError) missing name for badge
    defstruct_functions.exs:13: Attendee.print_vip_badge/1
    iex:29: (file)
iex(31)> Attendee.describe(a1)
"Name: Cameron, Paid: false, Over 18: false"
```

Structs also play a large role when implementing polymorphism, which we’ll see when we look at protocols on page 329.

## Nested Dictionary Structures

Dictionary structures allow us to associate keys with values. The values can be any type, including other dictionary structures. This allows us to create nested structures.

```zsh
iex(33)> %Customer{}
%Customer{name: "", company: ""}
iex(34)> c1 = %Customer{name: "Cameron", company: "Pluralsight"}
%Customer{name: "Cameron", company: "Pluralsight"}
iex(35)> %BugReport{}
%BugReport{owner: %Customer{name: "", company: ""}, details: "", severity: 1}
iex(36)> b1 = %BugReport{owner: c1, details: "Bad stuff"}           
%BugReport{
  owner: %Customer{name: "Cameron", company: "Pluralsight"},
  details: "Bad stuff",
  severity: 1
}
```

Here, the `owner` attribute of the bug report is itself a `Customer struct`.
We can access the `company` attribute of the `owner` by using the dot operator:

```zsh
iex(37)> b1.owner.company
"Pluralsight"

# update the company name in a crude manner:
iex(39)> report = %BugReport{ b1 | owner: %Customer{ b1.owner | company: "IBM" }}     
%BugReport{
  owner: %Customer{name: "Cameron", company: "IBM"},
  details: "Bad stuff",
  severity: 1
}

#update the company name in a more elegant manner:
#put_in:
iex(40)> put_in(report.owner.company, "Cardiff Electrics")
%BugReport{
  owner: %Customer{name: "Cameron", company: "Cardiff Electrics"},
  details: "Bad stuff",
  severity: 1
}
#update_in:
iex(41)> update_in(report.owner.name, &("Mrs. " <> &1))                          
%BugReport{
  owner: %Customer{name: "Mrs. Cameron", company: "IBM"},
  details: "Bad stuff",
  severity: 1
}

#get_in:

#get_and_update_in:
iex(42)> get_and_update_in(report.owner.name, &{&1, "Mr. " <> &1})               
{"Mrs. Cameron", %BugReport{
  owner: %Customer{name: "Mr. Cameron", company: "IBM"},
  details: "Bad stuff",
  severity: 1
}}
```

### Nested Accessors and Nonstructs

With nested accessor functions we can supply the keys as atoms:

```zsh
iex(46)> report2 = %{owner: %{name: "Gordon", company: "Mutiny"}, severity: 2} 
%{owner: %{company: "mutiny", name: "Gordon"}, severity: 2}
iex(52)> put_in(report2[:owner][:company], "Cardiff Electric")                   
%{owner: %{company: "Cardiff Electric", name: "Gordon"}, severity: 2}
iex(54)> update_in(report2[:owner][:company], &(&1 <> " inc."))  
%{owner: %{company: "Mutiny inc.", name: "Gordon"}, severity: 2}
```

### Dynamic (Runtime) Nested Accessors

The nested accessors have some limitations:

* The number of keys you pass a particular call is static.
* You can’t pass the set of keys as parameters between functions.

These are natural consequences of the way the macros bake their parameters into code at compile time.
The solution is to add a list of keys as a separate parameter!

[dynamic nested maps](map_dynamic_nested.exs)

```zsh
iex(1)> c("map_dynamic_nested.exs")
%{actor: %{first: "Robin", last: "Wright"}, role: "princess"}
[]
iex(2)> c("map_dynamic_nested.exs")                    
%{actor: %{first: "Robin", last: "Wright"}, role: "princess"}
%{first: "Robin", last: "Wright"}
[]
iex(3)> c("map_dynamic_nested.exs")                    
%{actor: %{first: "Robin", last: "Wright"}, role: "princess"}
%{first: "Robin", last: "Wright"}
%{
  buttercup: %{actor: %{first: "Robin", last: "Wright"}, role: "princess"},
  westley: %{actor: %{first: "Cary", last: "Elves"}, role: "farm boy"}
}
[]
```

There’s a cool trick that the dynamic versions of both get_in and get_and_update_in support—if you pass a function as a key, that function is invoked to return the corresponding values:

[get_in with function](get_in_w_fun.exs)

```zsh
iex(4)> c("get_in_w_fun.exs")      
["José", nil, "Larry"]
[]
```

## The Access Module

The Access module provides a number of predefined functions to use as parameters to get and get_and_update_in. These functions act as simple filters while traversing the structures.

[Access Module](access1.exs)

```zsh
iex(7)> c("access1.exs")
[]
iex(8)> c("access1.exs")
["Buttercup", "Westley"]
[]
iex(9)> c("access1.exs")
["Buttercup", "Westley"]
"farm boy"
[]
```

The `elem function` works on `tuples`:

[Access Module](access2.exs)

```zsh
iex(21)> c("access2.exs")
[{"Robin", "Wright"}, {"Carey", "Elwes"}]
["Wright", "Elwes"]
[]
```

The `key` and `key!` functions work on dictionary types (maps and structs). The difference between them is that the `key` and `key!` functions do not need to be implemented by the dictionary type. The `key` function returns nil if the key is not present in the dictionary, while the `key!` function raises a `KeyError` exception.

```zsh
iex(27)> c("access3.exs")
%{actor: {"Robin", "Wright"}, role: "princess"}
{"Robin", "Wright"}
{"Robin", "Wright"}
"Wright"
{"princess",
 %{
   buttercup: %{actor: {"Robin", "Wright"}, role: "Queen"},
   westley: %{actor: {"Carey", "Elwes"}, role: "farm boy"}
 }}
[]
```

Finally, `Access.pop` removes the entry with a given key from a map or keyword list. It returns a tuple containing the value associated with the key and the updated container. nil is returned for the value if the key isn’t in the container.

```zsh
iex(31)> Access.pop(%{name: "Elixir", creator: "Valim"}, :name)
{"Elixir", %{creator: "Valim"}}
iex(32)> Access.pop([name: "Elixir", creator: "Valim"], :name)
{"Elixir", [creator: "Valim"]}
iex(33)> Access.pop(%{name: "Elixir", creator: "Valim"}, :pony)
{nil, %{creator: "Valim", name: "Elixir"}}
```

## SETS

Sets are implemented via the module `MapSet`. The `MapSet` module provides a set data structure. Sets are collections of distinct elements. The elements of a set are not ordered. The elements of a set are unique. The elements of a set are immutable.

```zsh
iex(43)> set1 = 1..5 |> Enum.into(MapSet.new())
MapSet.new([1, 2, 3, 4, 5])
iex(44)> set2 = 3..7 |> Enum.into(MapSet.new())
MapSet.new([3, 4, 5, 6, 7])
iex(45)> MapSet.union(set1, set2)              
MapSet.new([1, 2, 3, 4, 5, 6, 7])
iex(46)> MapSet.intersection(set1, set2)
MapSet.new([3, 4, 5])
iex(47)> MapSet.difference(set1, set2)
MapSet.new([1, 2])
iex(48)> MapSet.difference(set2, set1)
MapSet.new([6, 7])
iex(49)> MapSet.difference(set2, set2)
MapSet.new([])
```

## PROTOCOLS

Protocols are a mechanism for polymorphism in Elixir. They allow us to define a set of functions that can be implemented for different modules. The protocol itself is a module that defines a set of functions. The functions are implemented by other modules. The protocol module is responsible for dispatching the function calls to the correct implementation.
