# Anonymous Functions

Anonymous functions are functions that don't have a name. In elixir, anonymous functions are defined with the `fn` keyword. The `fn` keyword is followed by a list of parameters, a `->` and the function body. The function body is the last expression in the function. The `fn` keyword is followed by a `end` keyword.

```elixir
iex(2)> a=5
5
iex(3)> b=42
42
iex(4)> sum = fn (a, b) -> a + b end
#Function<41.3316493/2 in :erl_eval.expr/6>
iex(5)> sum.(a,b)
47
iex(9)> greet = fn() -> IO.puts("Hi") end
#Function<43.3316493/0 in :erl_eval.expr/6>
iex(10)> greet
greet    
iex(10)> greet.()
Hi
:ok
```

In comparison, a named function "double" and its invocation with 3:

```elixir
iex(2)> a=5
5
iex(3)> b=42
42
iex(7)> defmodule MyModule do
...(7)> def double(a) do
...(7)> a*2
...(7)> end
...(7)> end
{:module, MyModule,
 <<70, 79, 82, 49, 0, 0, 5, 184, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 175,
   0, 0, 0, 18, 15, 69, 108, 105, 120, 105, 114, 46, 77, 121, 77, 111, 100, 117,
   108, 101, 8, 95, 95, 105, 110, 102, 111, ...>>, {:double, 1}}
iex(8)> MyModule.double(3)
6
```

As Elixir doesn't `assign` but does `pattern matching` on the parameters, the following code will work:

```elixir
iex(11)> swap = fn({a,b})->{b,a} end
#Function<42.3316493/1 in :erl_eval.expr/6>
iex(12)> swap.(5,6)
** (BadArityError) #Function<42.3316493/1 in :erl_eval.expr/6> with arity 1 called with 2 arguments (5, 6)
    (stdlib 4.2) erl_eval.erl:714: :erl_eval.do_apply/6
    iex:12: (file)
iex(12)> swap.({5,6})
{6, 5}
```

Two function bodies:

```elixir
iex(26)> handle_open=fn
...(26)> ({:ok, file}) -> "Read data: #{IO.read(file, :line)}"
...(26)> ({_, error}) -> "Error: #{:file.format_error(error)}"
# Attention: This :file part of refers to the underlying Erlang File module, so we can call its format_error function! 
...(26)> end
#Function<42.3316493/1 in :erl_eval.expr/6>
iex(27)> handle_open.(File.open("./.gitignore")))
# Attention: That File.open function is part of an Elixir built-in Module!
** (SyntaxError) iex:27:40: unexpected token: )
    |
 27 | handle_open.(File.open("./.gitignore")))
    |                                        ^
    (iex 1.14.2) lib/iex/evaluator.ex:292: IEx.Evaluator.parse_eval_inspect/3
    (iex 1.14.2) lib/iex/evaluator.ex:187: IEx.Evaluator.loop/1
    (iex 1.14.2) lib/iex/evaluator.ex:32: IEx.Evaluator.init/4
    (stdlib 4.2) proc_lib.erl:240: :proc_lib.init_p_do_apply/3
iex(27)> handle_open.(File.open("./.gitignore")) 
"Read data: .DS_Store\n"
iex(28)> handle_open.(File.open("./nothing-there"))
"Error: no such file or directory"
```

