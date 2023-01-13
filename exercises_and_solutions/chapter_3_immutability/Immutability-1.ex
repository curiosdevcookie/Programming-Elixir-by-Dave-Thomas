

#create a new list with values 1,2,3:
list = [1,2,3]

#map over the list and add 1 to each value:
list2 = Enum.map(list, fn x -> x + 1 end)

#check if the list contains 4:
Enum.member?(list, 4)

#Prepend 0 to the list:
list3 = [0 | list]

#create a String "elixir":
string = "elixir"

#convert the string to a list:
string2 = String.codepoints(string)

#capitalize the first letter of the string:
string3 = String.capitalize(string2)

#capitalize the second letter of string3:
defmodule Immutable do
  def capitalize_second(string) do
    String.slice(string, 0, 1) <> String.capitalize(String.slice(string, 1, 1)) <> String.slice(string, 2..-1)
#alternatively:
Enum.join([String.slice(string, 0, 1), String.capitalize(String.slice(string, 1, 1)), String.slice(string, 2..-1)])

#alternatively:
string4 = "#{String.slice(string, 0, 1)}#{String.capitalize(String.slice(string, 1, 1))}#{String.slice(string, 2..-1)}"
end

#capitalize the second letter of string3:
string5 = capitalize_second(string3)
