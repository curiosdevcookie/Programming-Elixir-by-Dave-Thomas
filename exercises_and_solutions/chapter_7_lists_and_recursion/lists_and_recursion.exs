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
    # IO.puts(MyList.add_one([1, 2, 3, 4, 5])) # 15

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

  end
end
