defmodule Guesswork do


  range = 1..10
  actual = 7

  IO.puts "Guess a number between #{Enum.min(range)} and #{Enum.max(range)}!"

  def guess(actual, range) do

  guess = Enum.random(range)

    if guess == actual do
      IO.puts "You got it!"
      IO.puts "The number was #{guess}"
    else
      IO.puts "Nope, try again!"
      guess(actual, range)
    end
  end

end
