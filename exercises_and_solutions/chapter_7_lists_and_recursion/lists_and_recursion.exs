defmodule ListsAndRecursion do

  defmodule MyList do
    def len([]), do: []
    def len([_head | tail]), do: [1 + len(tail)]
    # IO.puts(MyList.len([1, 2, 3, 4, 5])) # 5
    # IO.puts(MyList.len([])) # 0

    # What happens under the hood, step by step:
      # len([11,12,13,14,15])
      # = 1 + len([12,13,14,15])
      # = 1 + 1 + len([13,14,15])
      # = 1 + 1 + 1 + len([14,15])
      # = 1 + 1 + 1 + 1 + len([15])
      # = 1 + 1 + 1 + 1 + 1 + len([]) =1+1+1+1+1+0
      # =5

    def square([]), do: []
    def square([head | tail]), do: [head*head | square(tail)]
    # IO.puts(MyList.square([1, 2, 3, 4, 5])) # 55

    # What happens under the hood, step by step:
      # square([11,12,13,14,15])
      # = [11*11 | square([12,13,14,15])]
      # = [121 | [12*12 | square([13,14,15])]]
      # = [121 | [144 | [13*13 | square([14,15])]]]
      # = [121 | [144 | [169 | [14*14 | square([15])]]]]
      # = [121 | [144 | [169 | [196 | [15*15 | square([])]]]]]
      # = [121 | [144 | [169 | [196 | [225 | square([])]]]]]
      # = [121 | [144 | [169 | [196 | [225 | []]]]]]

    def add_one([]), do: []
    def add_one([head | tail]), do: [head+1 | add_one(tail)]
    # IO.puts(MyList.add_one([11,12,13,14,15]) # 75

     # What happens under the hood, step by step:
      # add_one([11,12,13,14,15])
      # = [11+1 | add_one([12,13,14,15])]
      # = [12 | [12+1 | add_one([13,14,15])]]
      # = [12 | [13 | [13+1 | add_one([14,15])]]]
      # = [12 | [13 | [14 | [14+1 | add_one([15])]]]]
      # = [12 | [13 | [14 | [15 | [15+1 | add_one([])]]]]]
      # = [12 | [13 | [14 | [15 | [16 | add_one([])]]]]]
      # = [12 | [13 | [14 | [15 | [16 | []]]]]]

      def sum([]), do: 0
      def sum([head | tail]), do: head + sum(tail)
      # IO.puts(MyList.sum([11,12,13,14,15])) # 65

      # What happens under the hood, step by step:
      # sum([11,12,13,14,15])
      # = 11 + sum([12,13,14,15])
      # = 11 + 12 + sum([13,14,15])
      # = 11 + 12 + 13 + sum([14,15])
      # = 11 + 12 + 13 + 14 + sum([15])
      # = 11 + 12 + 13 + 14 + 15 + sum([])
      # = 11 + 12 + 13 + 14 + 15 + 0
      # = 65
  end

  defmodule MyReduce do

    def mappi([], fun), do: []
    def mappi([head | tail], fun), do: [fun.(head) | mappi(tail, fun)]

    IO.puts(MyReduce.mappi([1, 2, 3, 4, 5], fn(x) -> x * x end)) # [1, 4, 9, 16, 25]
    IO.puts(MyReduce.mappi([1, 2, 3, 4, 5], fn(x) -> x + 1 end)) # [2, 3, 4, 5, 6]

    def reducing([], value, _fun), do: acc
    def reducing([head | tail], value, fun), do: reduce_to_sum(tail, fun.(value, head), fun)

    IO.puts(MyReduce.reducing([1, 2, 3, 4, 5], 0, fn(acc, x) -> acc + x end)) # 15
    IO.puts(MyReduce.reducing([1, 2, 3, 4, 5], -1, fn(acc, x) -> acc + x end)) # 14
    IO.puts(MyReduce.reducing([1, 2, 3, 4, 5], 0, fn(acc, x) -> acc * x end)) # 0
    IO.puts(MyReduce.reducing([1, 2, 3, 4, 5], 1, fn(acc, x) -> acc * x end)) # 120
    IO.puts(MyReduce.reducing([1, 2, 3], 1, fn(acc, x) -> acc * x end)) # 6

    #What happens under the hood, step by step:
      # reducing([1, 2, 3, 4, 5], 0, fn(acc, x) -> acc + x end)
      # = reducing([2, 3, 4, 5], 1, fn(acc, x) -> acc + x end)
      # = reducing([3, 4, 5], 3, fn(acc, x) -> acc + x end)
      # = reducing([4, 5], 6, fn(acc, x) -> acc + x end)
      # = reducing([5], 10, fn(acc, x) -> acc + x end)
      # = reducing([], 15, fn(acc, x) -> acc + x end)
      # = 15

    #What happens under the hood, step by step:
      # reducing([1, 2, 3, 4, 5], -1, fn(acc, x) -> acc + x end)
      # = reducing([2, 3, 4, 5], 0, fn(acc, x) -> acc + x end)
      # = reducing([3, 4, 5], 2, fn(acc, x) -> acc + x end)
      # = reducing([4, 5], 5, fn(acc, x) -> acc + x end)
      # = reducing([5], 9, fn(acc, x) -> acc + x end)
      # = reducing([], 14, fn(acc, x) -> acc + x end)
      # = 14

    #What happens under the hood, step by step:
      # reducing([1, 2, 3, 4, 5], 0, fn(acc, x) -> acc * x end)
      # = reducing([2, 3, 4, 5], 0, fn(acc, x) -> acc * x end)
      # = reducing([3, 4, 5], 0, fn(acc, x) -> acc * x end)
      # = reducing([4, 5], 0, fn(acc, x) -> acc * x end)
      # = reducing([5], 0, fn(acc, x) -> acc * x end)
      # = reducing([], 0, fn(acc, x) -> acc * x end)
      # = 0

    #What happens under the hood, step by step:
      # reducing([1, 2, 3, 4, 5], 1, fn(acc, x) -> acc * x end)
      # = reducing([2, 3, 4, 5], 1, fn(acc, x) -> acc * x end)
      # = reducing([3, 4, 5], 2, fn(acc, x) -> acc * x end)
      # = reducing([4, 5], 6, fn(acc, x) -> acc * x end)
      # = reducing([5], 24, fn(acc, x) -> acc * x end)
      # = reducing([], 120, fn(acc, x) -> acc * x end)
      # = 120
    end
  end
end
