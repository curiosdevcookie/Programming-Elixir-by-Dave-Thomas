defmodule Datastructures do
  # Keywordlists

  defmodule Canvas do
    @defaults [fg: "black", bg: "rebeccapurple", font: "Merriweather"]

    def draw(text, options \\ []) do
      options = Keyword.merge(@defaults, options)
      IO.puts("Drawing text #{inspect(text)}")
      IO.puts("Foreground: #{options[:fg]}")
      IO.puts("Background: #{Keyword.get(options, :bg)}")
      IO.puts("Font: #{options[:font]}")
      IO.puts("Pattern: #{Keyword.get(options, :pattern, "solid")}")
      IO.puts("Style: #{options[:style] || "normal"}")
    end

    # Datastructures.Canvas.draw("hello", fg: "red", style: "italic", style: "bold")
    # =>
    # Drawing text "hello"
    # Foreground: red
    # Background: rebeccapurple
    # Font: Merriweather
    # Pattern: solid
    # Style: italic
  end

  # Maps

  defmodule Query do
    people = [
      %{name: "Grumpy", height: 1.82},
      %{name: "Dave", height: 1.78},
      %{name: "Dopey", height: 1.27},
      %{name: "Shaquille", height: 2.16},
      %{name: "Sneezy", height: 1.28}
    ]

    IO.inspect(for person = %{height: height} <- people, height > 1.5, do: person)

    # [
    #   %{height: 1.82, name: "Grumpy"},
    #   %{height: 1.78, name: "Dave"},
    #   %{height: 2.16, name: "Shaquille"}
    # ]

    def taller_than(people) do
      for person = %{height: height} <- people, height > 1.5, do: person
    end
  end
end
