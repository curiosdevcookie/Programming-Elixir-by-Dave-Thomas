nested = %{
  buttercup: %{
    actor: %{
      first: "Robin",
      last: "Wright"
    },
    role: "princess"
  },
  westley: %{
    actor: %{
      first: "Cary",
      # intentional typo
      last: "Elwes"
    },
    role: "farm boy"
  }
}

IO.inspect(get_in(nested, [:buttercup]))
IO.inspect(get_in(nested, [:buttercup, :actor]))
IO.inspect(put_in(nested, [:westley, :actor, :last], "Elves"))
