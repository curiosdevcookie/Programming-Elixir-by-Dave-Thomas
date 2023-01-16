# Modules

Modules provide namespaces for things you define. They also act as a container/wrapper for macros, structs, protocols, and other modules.

## Module Directives

### Aliasing Modules

You can alias modules with the `alias` keyword. This allows you to call the functions without using the module name.

Without aliasing:

```elixir
defmodule Math do
  def double(x) do
    x * 2
  end

  def square(x) do
    x * x
  end
end
```

With aliasing:

```elixir
defmodule MathClient do
  alias Math
  def double_and_square(x) do
    x |> Math.double() |> Math.square()
  end
end
```

The syntax can be shortened from the following:
  
  ```elixir
  alias My.Other.Module.Parser, as: Parser 
  alias My.Other.Module.Runner, as: Runner
  ```

  to:

  ```elixir
  alias My.Other.Module.Parser
  alias My.Other.Module.Runner
  ```

  to:

  ```elixir
  alias My.Other.Module.{Parser, Runner}
  ```

### Importing Modules

You can import modules with the `import` keyword. This allows you to call the functions without using the module name.

Without importing:

```elixir
defmodule Math do
  def double(x) do
    x * 2
  end

  def square(x) do
    x * x
  end
end
```

With importing:

```elixir
defmodule MathClient do
  import Math
  def double_and_square(x) do
    x |> double() |> square()
  end
end
```

 It's a good idea to use `import`in the smallest possible enclosing scope, the syntax of import is `import Module [, only:|except: ]`. The `only` option allows you to specify a list of functions to import, and the `except` option allows you to specify a list of functions to exclude from import. The number is the function's arity.

```elixir
defmodule MathClient do
  import Math, only: [double: 1]
  def double_and_square(x) do
    x |> double() |> Math.square()
  end
end
```

Alternatively, you can give only: one of the atoms :functions or :macros, and import
will bring in only functions or macros.

### The Require directive

The `require` directive is used to import macros from other modules. It is similar to `import`, but it doesn't import functions. It is also used to import protocols. The syntax is `require Module`.

## Nested Modules

Modules can be nested:

```elixir
defmodule Math do
  defmodule Geometry do
    def area(x, y) do
      x * y
    end
  end
end
```

Use all module names to call the function: To call the `area` function in the `Geometry` module, you would write `Math.Geometry.area(2, 3)`. You can also alias the nested module.

Module nesting in Elixir is an illusion—all modules are defined at the top level. When we define a module inside another, Elixir simply prepends the outer module name to the inner module name, putting a dot between the two. This means we can directly define a nested module:

```elixir
defmodule Math.Geometry do
  def area(x, y) do
    x * y
  end
end
```

## Module Attributes

Elixir modules each have associated metadata. This metadata is stored in attributes. Module attributes are defined using the `@` symbol: @name value

This works only at the top level of a module—you can’t set an attribute inside a function definition. You can, however, access attributes inside functions.

```elixir
defmodule Example do 

  @author "Dave Thomas" 

    def get_author do
      @author
    end 
  end

  IO.puts "Example was written by #{Example.get_author}"
```

These attributes are not variables—they are constants. They are set at compile time and cannot be changed at runtime.

### Module Attributes and Compilation

Module attributes are used to control compilation. For example, you can use the `@moduledoc` attribute to provide documentation for a module. The `@moduledoc` attribute is used by the `ExDoc` library to generate documentation.

```elixir
defmodule Example do
  @moduledoc """
  This module provides a function to say hello.
  """
  def say_hello do
    "Hello"
  end
end
```

You can also use the `@doc` attribute to provide documentation for a function.

```elixir
defmodule Example do
  @moduledoc """
  This module provides a function to say hello.
  """
  @doc """
  This function says hello.
  """
  def say_hello do
    "Hello"
  end
end
```

### Module Attributes and Code

Module attributes can also be used to store code. For example, you can use the `@before_compile` attribute to run code before the module is compiled.

```elixir
defmodule Example do
  @before_compile unquote(__ENV__.file)
  def say_hello do
    "Hello"
  end
end
```

The `__ENV__` variable is a special variable that contains information about the current environment. The `file` key in the `__ENV__` variable contains the path to the current file.

### Module Attributes and Runtime

Module attributes can also be used to store values that are available at runtime. For example, you can use the `@version` attribute to store the version of the module.

```elixir
defmodule Example do
  @version 1.0
  def get_version do
    @version
  end
end
```

## Module Attributes Reference

The following is a list of the most commonly used module attributes:

* `@moduledoc` - Provides documentation for the module.
* `@doc` - Provides documentation for a function.
* `@behaviour` - Specifies a behaviour that the module implements.
* `@before_compile` - Runs code before the module is compiled.
* `@after_compile` - Runs code after the module is compiled.
* `@compile` - Specifies compiler options.
* `@deprecated` - Specifies a function as deprecated.
* `@impl` - Specifies that a function implements a behaviour.
* `@spec` - Specifies the typespec for a function.
* `@type` - Specifies a custom type.
* `@version` - Specifies the version of the module.

## Module names

When we write module names, they have names such as _Pony_ or _PhotoAlbum_. They are written in CamelCase/Bumpy Case. The first letter of each word is capitalized. The name of the module is the same as the name of the file, except that the file name is written in snake_case.

### Calling functions in Elixir modules

We call functions in them using calls such as `Pony.say_hello()` or `PhotoAlbum.get_photos()`.

When you write a name starting with an uppercase letter, such as IO, Elixir converts it internally into an atom of the same name with `Elixir.` prepended. So _IO_ becomes `Elixir.IO` and _Pony_ becomes `Elixir.Pony`. So a call to a function in a module is really an atom followed by a dot followed by the function name. So `Pony.say_hello()` is really `Elixir.Pony.say_hello()`.

```bash
iex> to_string IO 
"Elixir.IO"
iex> :"Elixir.IO" === IO 
true
```

### Calling functions in an Erlang library

Erlang name conventions are different, variables start with an uppercase letter and atoms are simple lowercase names.

Erlang `io.format(string, args)` function is called `:io.format(string, args)` in Elixir.

```bash
iex> :io.format("Hello, world!\n")
Hello, world!
:ok
```
