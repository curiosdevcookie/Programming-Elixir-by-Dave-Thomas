# String functions:

# String.at/2
"hello world" |> String.at(3)
# => "l"

# String.codepoints/1
"chère maman 👩‍👦‍👦" |> String.codepoints()

# => ["c", "h", "è", "r", "e", " ", "m", "a", "m", "a", "n", " ", "👩", "‍", "👦", "‍", "👦"]

# String.graphemes/1
"chère maman 👩‍👦‍👦" |> String.graphemes()
# => ["c", "h", "è", "r", "e", " ", "m", "a", "m", "a", "n", " ", "👩‍👦‍👦"]

# String.duplicate/2
"hello! " |> String.duplicate(3)
# => "hello! hello! hello! "

# String.length/1
"hello" |> String.length()
# => 5

# String.split/2
"hello world, everything will be better" |> String.split(" ")
# => ["hello", "world,", "everything", "will", "be", "better"]

# String.split/3
"hello world, everything will be better" |> String.split(" ", parts: 3)
# => ["hello", "world,", "everything will be better"]

# String.bag_distance/2
String.bag_distance("hello", "world")
# => 0.4
# The bag distance is meant to be an efficient approximation of the distance between two strings to quickly rule out strings that are largely different.

# String.jaro_distance/2
String.jaro_distance("hello", "world")
# => 0.4666666666666666

# String.myers_difference/2
String.myers_difference("hello", "world")
# [del: "hell", ins: "w", eq: "o", ins: "rld"]

# String.valid?/1
"hello" |> String.valid?()
# => true
<<0x80, 0x81>> |> String.valid?()
# => false
