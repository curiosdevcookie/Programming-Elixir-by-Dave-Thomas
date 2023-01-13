defmodule HandleOpen do

handle_open = fn
({:ok, file}) -> "First line: #{IO.read(file, :line)}"
({_, error}) -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("./.gitignore"))
IO.puts handle_open.(File.open("./nonexistent_file"))

# Path: Programming Elixir/solutions/chapter_5_anonymous_functions/first_steps/handle_open.exs

# To execute this file in the terminal, run:
# elixir handle_open.exs


# To execute this file in the interactive shell, run:
# iex c("handle_open.exs")
end
