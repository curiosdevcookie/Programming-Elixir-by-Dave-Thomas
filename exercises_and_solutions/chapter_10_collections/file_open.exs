# Reading a file

# Eagerly:
IO.puts(
  File.read!("../../test_text_file.txt")
  |> String.split("\n", trim: true)
  |> Enum.max_by(&String.length/1)
)

# Lazily:
IO.puts(
  File.open!("../../test_text_file.txt")
  |> IO.stream(:line)
  |> Enum.max_by(&String.length/1)
)

# Lazily and shorter:
IO.puts(
  File.stream!("../../test_text_file.txt")
  |> Enum.max_by(&String.length/1)
)
