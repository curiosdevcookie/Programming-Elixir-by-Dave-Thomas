# Collections: Enum and Stream

Elixir provides a number of functions for working with collections. These functions are grouped into two modules: Enum and Stream. Enum provides a set of functions for working with enumerable data structures, such as lists, maps, and ranges. Stream provides a set of functions for working with _lazy_ enumerables, such as streams.
Lazy enumerables are enumerables that are not evaluated until they are needed. This allows us to work with potentially infinite collections without running out of memory.

## Enum

Enum provides a number of functions for working with collections. The functions in Enum are designed to work with any enumerable data structure, such as lists, maps, and ranges. The functions in Enum are eager, which means that they are evaluated immediately.

