# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 6. Modules and Named Functions • 70, Exercise: ModulesAndFunctions-7

## 7.1 Float to string with two decimal digits (Erlang)

:erlang.float_to_binary/2 (erlang) and Float.to_string (elixir). The latter is a macro that calls the former.
Float.to_string/2 is deprecated in favor of :erlang.float_to_binary/2.

```bash
iex(10)> float = 3.14159
3.14159
iex(11)> :erlang.float_to_binary(float, decimals: 2)
"3.14"
```

## 7.2 Get the value of an operating-system environment variable (Elixir)

System.get_env (elixir).

```bash
iex(13)> System.get_env("HOME")
"/Users/ariadneengelbrecht"
iex(14)> System.monotonic_time()
-576455482492462226
```

## 7.3 Return the extension component of a file name (so return .exs if given "dave/test.exs") (Elixir)

Path.extname (elixir).

```bash
iex(18)> Path.extname("ModulesAndFunctions-7.md")
".md"
iex(22)> Path.basename("ModulesAndFunctions-7.md", Path.extname("ModulesAndFunctions-7.md")) 
"ModulesAndFunctions-7"
iex(27)> Path.basename("ModulesAndFunctions-7.md", Path.extname("ModulesAndFunctions-7.md"))<>Path.extname("ModulesAndFunctions-7.md")
"ModulesAndFunctions-7.md"
```

## 7.4 Return the process’s current working directory (Elixir)

File.cwd/0 (elixir). System.cwd/0 is deprecated in favor of File.cwd/0.

```bash
iex(28)> File.cwd()
{:ok,
 "/Users/ariadneengelbrecht/.../exercises_and_solutions/chapter_6_modules_named_functions"}
```

## 7.5 Convert a string containing JSON into Elixir data structures. (Elixir)

Jason.decode (elixir).

```bash
iex> Jason.decode("{\"name\":\"Dave\"}")
{:ok, %{"name" => "Dave"}}
```

### 7.6 Execute a command in your operating system’s shell and return the output (Elixir)

```bash
iex(1)> System.cmd("whoami", [])
{"ariadneengelbrecht\n", 0}
```

```bash
iex(2)> DateTime.utc_now()
~U[2023-01-16 11:00:08.221710Z]
```
