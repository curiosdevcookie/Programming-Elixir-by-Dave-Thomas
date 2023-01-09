# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 2. Pattern Matching • 20, Exercise: PatternMatching-3

* [a,b,a]=[1,2,3]
* [a,b,a]=[1,1,2]
* a=1
* ^a = 2
* ^a = 1
* ^a=2-a

```zsh
  iex(33)> [a,b,a]=[1,2,3]
  ** (MatchError) no match of right hand side value: [1, 2, 3]
      (stdlib 4.2) erl_eval.erl:496: :erl_eval.expr/6
      iex:33: (file)
  iex(33)> [a,b,a]=[1,1,2]
  ** (MatchError) no match of right hand side value: [1, 1, 2]
      (stdlib 4.2) erl_eval.erl:496: :erl_eval.expr/6
      iex:33: (file)
  iex(33)> a=1
  1
  iex(34)> ^a=2
  ** (MatchError) no match of right hand side value: 2
      (stdlib 4.2) erl_eval.erl:496: :erl_eval.expr/6
      iex:34: (file)
  iex(34)> ^a=1
  1
  iex(35)> ^a=2-a
  1
```
