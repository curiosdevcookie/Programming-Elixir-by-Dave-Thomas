defmodule Basics do

#RANGES

#inclusive range from 1 to 10:
range = 1..10

#exclusive range from 1 to 10:
range2 = Enum.slice(1..10, 1..-2)

#alternatively:
range3 = Enum.drop(1..10,1) |> Enum.drop(-1)

#a range can be used in a for loop:
for i <- 1..10 do
  IO.puts i
end

#REGEX

#match a string against a regex:
Regex.match?(~r/elixir/, "programming elixir") #true


#LISTS

#add an element to the beginning of a list:
list = [1,2,3]
list2 = [4|list] # [4,1,2,3]

#add an element to the end of a list:
list = [1,2,3]
list2 = list ++ [4] # [1,2,3,4]

#check if a value is in the list:
1 in [1,2,3] #true
5 in [1,2,3] #false

#check if a value is not in the list:
1 not in [1,2,3] #false
5 not in [1,2,3] #true

# Accessing tuples within lists:
keywordlist = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]

# Get the tuple with a given value:
List.keyfind(keywordlist, "Dave", 1) # {:name, "Dave"}
List.keyfind(keywordlist, "Programming", 1) # {:likes, "Programming"}
List.keyfind(keywordlist, "Dallas", 1) # {:where, "Dallas", "TX"}
List.keyfind(keywordlist, "Dallas", 2) # nil
List.keyfind(keywordlist, "TX", 2) # {:where, "Dallas", "TX"}
List.keyfind(keywordlist, "TX", 1, "No city called TX.") # "No city called TX."

# Get the value of a key:
keywordlist[:likes] # "Programming"
keywordlist[:name] # "Dave"
keywordlist[:where] # ** (CaseClauseError) no case clause matching: {:where, "Dallas", "TX"}

# Delete a tuple from a list:
keywordlist2 = List.keydelete(keywordlist, "Dallas", 1) #[name: "Dave", likes: "Programming"]

# Replace a key:
List.keyreplace(keywordlist2, :likes, 0, {:likes, "Elixir"}) # [name: "Dave", likes: "Elixir"]

# Updating in the middle (not a cheap operation):
list = [1,2,3]
List.replace_at(list, 1, '2️⃣') # [1, [50, 65039, 8419], 3]
List.replace_at(list, 1, "2️⃣") # [1, "2️⃣", 3]

#remove duplicates from a list:
Enum.uniq([1,2,3,1,2,3]) # [1,2,3]

#remove an element from a list:
list = [1,2,3]
list2 = list -- [2] # [1,3]

#remove an element from a list by index:
list = [1,2,3]
list2 = Enum.take(list, 1) ++ Enum.drop(list, 2) # [1,3]
list3 = Enum.take(list, -2) ++ Enum.drop(list, -1) # [2, 3, 1, 2]
list4 = Enum.take(list, 0) ++ Enum.drop(list, 1) # [2, 3]
list5 = Enum.take(list, 0) # []
list6 = Enum.drop(list, 2) # [3]
list7 = Enum.drop(list, -1) # [1, 2]

#remove an element from a list by value:
list = [1,2,3]
list2 = Enum.filter(list, fn x -> x != 2 end) # [1,3]
list3 = Enum.filter(list, fn x -> x!= 3 end) # [1,2]

#Find an element in a list:
list = [1,2,3]
Enum.find(list, fn x -> x == 2 end) # 2

#remove an element from a list by value and return it and the rest:
list = [1,2,3]
list2 = Enum.split(list, 2) # {[1,2], [3]}
list3 = Enum.split(list, 1) # {[1], [2,3]}
list4 = Enum.split(list, 0) # {{}, [1,2,3]}
list5 = Enum.split(list, -1) # {[1,2], [3]}
list6 = Enum.split(list, -2) # {[1], [2,3]}
list7 = Enum.split(list, -3) # {{}, [1,2,3]}

#split the Enum into chunks of 2:
list = [1,2,3,4,5,6]
list2 = Enum.chunk_every(list, 2) # [[1,2], [3,4], [5,6]]

#split the Enum at a particular position
list = [1,2,3,4,5,6]
Enum.split_while(list, fn x -> x < 4 end) # {[1,2,3], [4,5,6]}

#turn a string into a list:
str = "hello world"
list = String.split(str, "") # ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
#split the list into chunks of 2:
list2 = Enum.chunk_every(list, 2) # [["h", "e"], ["l", "l"], ["o", " "], ["w", "o"], ["r", "l"], ["d"]]

#turn a list into a string:
list = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
str = Enum.join(list, "") # "hello world"

#turn a list into a string and put a comma in the string:
list = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
str = Enum.join(list, ",") # "h,e,l,l,o, ,w,o,r,l,d"

#take the first element of a list:
list = [1,2,3]
hd(list) # 1

#take the last element of a list:
list = [1,2,3]
tl(list) # [2,3]

#take the second element of a list:
list = [1,2,3]
Enum.at(list, 1) # 2

#FLATTENING of a list
list = [1,2,3,[4,5,6]]
list2 = List.flatten(list) # [1,2,3,4,5,6]

# NOT flattening:
list3 = Enum.flat_map(list, fn x -> [x,x] end) # [1,1,2,2,3,3,[4,5,6]]

# Folding (like reduce, but can choose direction fold left/fold right:
# fold left ↩️:
list = [1,2,3]
List.foldl(list, "", fn value, acc -> "#{value}🚀#{acc}" end) # "3🚀2🚀1🚀"

# fold right ↪️:
list = [1,2,3]
List.foldr(list, "", fn value, acc -> "#{value}😄#{acc}" end) # "1😄2😄3😄"



#MAPS

#add a key-value pair to a map:
map = %{a: 1, b: 2}
map2 = Map.put(map, :c, 3) # %{a: 1, b: 2, c: 3}

#remove a key-value pair from a map:
map = %{a: 1, b: 2}
map2 = Map.delete(map, :a) # %{b: 2}
map3 = Map.delete(map, :b) # %{a: 1}

#update a key-value pair in a map:
map = %{a: 1, b: 2}
map2 = Map.update(map, :a, 0, fn x -> x * 3 end) # %{a: 3, b: 2}
map3 = %{map | a: 3} # %{a: 3, b: 2}
map4 = Map.update(map, :c, 0, fn x -> x * 3 end) # %{a: 1, b: 2, c: 0}

#update a key-value pair in a map only if it exists:
map = %{a: 1, b: 2}
map2 = Map.update!(map, :a, fn x -> x * 3 end) # %{a: 3, b: 2}
map3 = Map.update(map, :c, 0, fn x -> x * 3 end) # error

#check if a key exists in a map:
map = %{a: 1, b: 2}
Map.has_key?(map, :a) # true
Map.has_key?(map, :c) # false
Map.fetch(map, :a) # {:ok, 1}
Map.fetch(map, :c) # :error
Map.get(map, :a) # 1
Map.get(map, :c) # nil

#turn a list into a map:
list = [1,2,3]
map = Enum.into(list, %{}) # %{1 => 1, 2 => 2, 3 => 3}



#OPERATORS
#Arithmetic operators:

# + - * / div rem

#div returns the integer part of a division:
10 |> div(3) # 3

#remainder of 10/3:
10 |> rem(3) # 1

# in operator

#check if a value is in an enum:

# defmodule Color do
#   @enums [:red, :green, :blue]
# end

# color = :red

# if color in Color do
#   IO.puts("valid color")
# else
#   IO.puts("invalid color")
# end
end
