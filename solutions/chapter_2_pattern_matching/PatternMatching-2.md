# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 2. Pattern Matching • 19, Exercise: PatternMatching-2

* [a,b,a]=[1,2,3]
* [a,b,a]=[1,1,2]
* [a,b,a]=[1,2,1]

```zsh
    iex(31)> [a,b,a]=[1,2,3]
    **(MatchError) no match of right hand side value: [1, 2, 3]
        (stdlib 4.2) erl_eval.erl:496: :erl_eval.expr/6
        iex:31: (file)
    iex(31)> [a,b,a]=[1,1,2]
    ** (MatchError) no match of right hand side value: [1, 1, 2]
        (stdlib 4.2) erl_eval.erl:496: :erl_eval.expr/6
        iex:31: (file)
    iex(31)> [a,b,a]=[1,2,1]
    [1, 2, 1]
````
