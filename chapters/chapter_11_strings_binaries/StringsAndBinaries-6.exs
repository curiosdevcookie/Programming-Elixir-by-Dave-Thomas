defmodule Capitalize do
  @doc """
  Write a function to capitalize the sentences in a string. Each sentence is terminated by a period and a space. Right now, the case of the characters in the string is random.
  """

  @sentence "oh. a DOG. woof. "

  def capitalize_sentence() do
    @sentence
    |> String.split(" ")
    |> Enum.map(fn word -> String.capitalize(word) end)
    |> Enum.join(" ")
  end
end
