defmodule ASCII do
  @doc """

  Write a function that returns true if a single-quoted string contains only printable ASCII characters (space through tilde).

  """

  def is_ascii_printable?(charlist) do
    case List.ascii_printable?(charlist) do
      true -> true
      false -> false
    end
  end

  def is_ascii_printable?(charlist), do: List.ascii_printable?(charlist)
end
