defmodule Anagram do
  @doc """
  Write an anagram?(word1, word2) that returns true if its parameters are anagrams.

  """

  def anagram?(word1, word2) when is_binary(word1) and is_binary(word2) do
    case String.length(word1) == String.length(word2) do
      true ->
        word1
        |> Anagram.ana_helper_string() ==
          word2
          |> Anagram.ana_helper_string()

        IO.puts("Yep, those words are anagrams.")

      false ->
        IO.puts("Nope, those words aren't anagrams.")
    end
  end

  def anagram?(word1, word2) when is_list(word1) and is_list(word2) do
    case length(word1) == length(word2) do
      true ->
        word1
        |> List.to_string()
        |> Anagram.ana_helper_string() ==
          word2
          |> List.to_string()
          |> Anagram.ana_helper_string()

        IO.puts("Yep, those words are anagrams.")

      false ->
        IO.puts("Nope, those words aren't anagrams.")
    end
  end

  def anagram?(word1, word2) when is_list(word1) and is_binary(word2) do
    case length(word1) == String.length(word2) do
      true ->
        word1
        |> List.to_string()
        |> Anagram.ana_helper_string() ==
          word2
          |> Anagram.ana_helper_string()

        IO.puts("Yep, those words are anagrams.")

      false ->
        IO.puts("Nope, those words aren't anagrams.")
    end
  end

  def anagram?(word1, word2) when is_binary(word1) and is_list(word2) do
    case String.length(word1) == length(word2) do
      true ->
        word1
        |> Anagram.ana_helper_string() ==
          word2
          |> List.to_string()
          |> Anagram.ana_helper_string()

        IO.puts("Yep, those words are anagrams.")

      false ->
        IO.puts("Nope, those words aren't anagrams.")
    end
  end

  def ana_helper_string(string) do
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
    |> Enum.join()
  end
end
