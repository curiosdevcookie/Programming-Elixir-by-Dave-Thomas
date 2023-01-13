#---
# Excerpted from "Programming Elixir ≥ 1.6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir16 for more book information.
#---
defmodule Greeter do
  def for(name, greeting, additionalString) do
    fn
      (^name) -> "#{greeting} #{name}, #{additionalString}"
      (_)     -> "I don't know you"
    end
  end
end

mr_valim = Greeter.for("José", "Oi!", "how are you?")
mr_dave = Greeter.for("Dave", "I'm sorry,", "I can't do that")

IO.puts mr_valim.("José")    # => Oi! José
IO.puts mr_valim.("Dave")    # => I don't know you
IO.puts mr_dave.("Dave")    # => I'm sorry, Dave
IO.puts mr_dave.("José")    # => I don't know you


# To execute this file in the interactive shell, run:
# iex c("pin.exs")

# To execute this file in the terminal, run:
# elixir pin.exs
