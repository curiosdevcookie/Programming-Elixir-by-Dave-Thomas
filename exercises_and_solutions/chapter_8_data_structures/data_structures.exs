defmodule Datastructures do

  # Keywordlists

  defmodule Canvas do

    @defaults [fg: "black", bg: "rebeccapurple", font: "Merriweather"]

    def draw(text, options \\ []) do
      options = Keyword.merge(@defaults, options)
      IO.puts "Drawing text #{inspect(text)}"
      IO.puts "Foreground: #{options[:fg]}"
      IO.puts "Background: #{Keyword.get(options, :bg)}"
      IO.puts "Font: #{options[:font]}"
      IO.puts "Pattern: #{Keyword.get(options, :pattern, "solid")}"
      IO.puts "Style: #{options[:style] || "normal"}"
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
end
