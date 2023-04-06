defmodule StringPyramid do
  @doc """
  Write a function that takes a list of double-quoted strings and prints each on a separate line, centered in a column that has the width of the longest string. Make sure it works with UTF characters.
  """
  @animals ["cat", "elephant", "zebra", "spider-monkey", "crocodile"]

  def draw_pyramid(list) do
    @animals
    |> Enum.sort_by(&byte_size/1)
    |> Enum.each(fn x -> StringPyramid.prepare_string(x) |> IO.puts() end)
  end

  def prepare_string(string) do
    distance = ((80 - String.length(string)) / 2) |> trunc()
    whitespace = String.duplicate(" ", distance)
    string_with_whitespace = "#{whitespace}#{string}#{whitespace}"
  end
end
