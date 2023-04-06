defmodule StringCalculator do
  @doc """
    Write a function that takes a single-quoted string of the form number [+-*/] number and returns the result of the calculation.
    The individual numbers do not have leading plus or minus signs.
  """

  def calculate_helper(string) when is_list(string) do
    new_string = string |> List.to_string() |> String.split(" ")
  end

  def calculate_helper(string) when is_binary(string) do
    new_string = string |> String.split(" ")
  end

  def calculate(string) do
    new_string = StringCalculator.calculate_helper(string)

    number1 = new_string |> List.first() |> Float.parse() |> elem(0)
    number2 = new_string |> List.last() |> Float.parse() |> elem(0)
    operator = new_string |> Enum.at(1)

    case operator do
      "+" -> number1 + number2
      "-" -> number1 - number2
      "*" -> number1 * number2
      "/" -> number1 / number2
    end
  end
end
