defmodule Datastructures do
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

    # [
    #   %{height: 1.82, name: "Grumpy"},
    #   %{height: 1.78, name: "Dave"},
    #   %{height: 2.16, name: "Shaquille"}
    # ]
  end

  defmodule HotelRoom do
    @people [
      %{name: "Grumpy", height: 1.82},
      %{name: "Dave", height: 1.78},
      %{name: "Dopey", height: 1.27},
      %{name: "Shaquille", height: 2.16},
      %{name: "Sneezy", height: 1.28}
    ]
    def book(%{name: name, height: height}) when height > 1.9 do
      IO.puts("Need extra-long bed for #{name}.")
    end

    # Datastructures.HotelRoom.book(%{name: "Grumpy", height: 1.82})
    # => Need regular bed for Grumpy

    def book(%{name: name, height: height}) when height < 1.3 do
      IO.puts("Need low shower controls for #{name}.")
    end

    # IMPORTANT: This is sort of a relative/implicit way of doing things:
    def book(person) do
      IO.puts("Need regular bed for #{person.name}.")
    end

    # Datastructures.HotelRoom.book(%{name: "Grumpy", height: 1.82})
    # => Need regular bed for Grumpy

    def people() do
      # @people |> Enum.each(fn person -> book(person) end)
      # @people |> Enum.each(&book(person))
      @people |> Enum.each(&book/1)
    end
  end
end
