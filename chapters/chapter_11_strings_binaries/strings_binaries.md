# Strings and Binaries

Elixir strings are UTF-8 encoded binaries. They are not the same as character lists, which are lists of integers. Strings are surrounded by double quotes, while character lists are surrounded by single quotes.

## String interpolation

String interpolation is a way to embed expressions in strings. The syntax is to use `#{}` to embed an expression. The expression is evaluated and the result is converted to a string and inserted into the string.

```zsh
iex(1)> name = "Dave"
"Dave"
iex(2)> "Hello, #{name}"
"Hello, Dave"
iex(3)> name = "susi"
"susi"
iex(4)> "Hello, #{String.capitalize name}!"
"Hello, Susi!"
```

## heredocs

Heredocs are a way to embed multi-line strings in your code. The syntax is to use `"""` to start the string and `"""` to end the string. The string can contain any characters, including newlines.

```zsh
iex(5)>  """ 
...(5)> This 
...(5)> is 
...(5)> a 
...(5)> multi-line 
...(5)> string
...(5)> """
"This \nis \na \nmulti-line \nstring\n"
```

## Sigils

A sigil starts with a tilde, followed by an upper- or lowercase letter, some delimited content, and perhaps some options. The delimiters can be <...>, {...}, [...], (...), |...|, /.../, "...", and '...'.

```zsh
iex(9)> ~s(Hello, #{name})
"Hello, susi"
iex(10)> ~s(Hello, #{String.capitalize name}!)
"Hello, Susi!"
```

The letter determines the sigil’s type:

* `~c` is a character list, escaped and interpolated just like a single-quoted string
* `~C` is a character list with no escaping or interpolation
* `~D` is a Date in the format yyyy-mm-dd
* `~N` is a naive (raw) DateTime in the format yyyy-mm-dd hh:mm:ss[.ddd]
* `~r` is a regular expression, escaped and interpolated
* `~R` is a regular expression with no escaping or interpolation
* `~s` is a string, escaped and interpolated just like a double-quoted string
* `~S` is a string with no escaping or interpolation
* `~T` is a Time in the format hh:mm:ss[.dddd]
* `~w` is a word list, split on whitespace, with escaping and interpolation
* `~W` is a word list with no escaping or interpolation

```bash
iex(11)>  ~S(Hello, #{name})
"Hello, \#{name}"
iex(12)>  ~s(Hello, #{name})
"Hello, susi"
```

```bash
iex(13)> ~w(Hello, #{name})
["Hello,", "susi"]
iex(14)> ~w(Hello, #{String.capitalize name}!)
["Hello,", "Susi!"]
```

```bash
iex(15)> ~D<1999-12-31>
~D[1999-12-31]
```

### Single-quoted strings

Single-quoted strings are character lists.

```bash
iex(17)> [ head | tail ] = 'cat'
'cat'
iex(18)> head
99 # return the integer code for a character with a leading ? before the letter
iex(19)> tail
'at'
iex(20)> [head|tail]
'cat'
```

```bash
# return the integer code for a character with a leading ? before the letter
iex(21)> ?c
99
iex(22)> ?b
98
iex(23)> ?😌
128524
```

### Double-quoted strings

Double-quoted strings are UTF-8 encoded binaries.

```bash
iex(21)> [ head | tail ] = "cat"
#** (MatchError) no match of right hand side value: "cat"
```

