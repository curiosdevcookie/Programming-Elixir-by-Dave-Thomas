cast = %{
  buttercup: %{
    actor: {"Robin", "Wright"},
    role: "princess"
  },
  westley: %{
    actor: {"Carey", "Elwes"},
    role: "farm boy"
  }
}

IO.inspect(get_in(cast, [:buttercup]))
# => %{actor: {"Robin", "Wright"}, role: "princess"}
# []

IO.inspect(get_in(cast, [:buttercup, :actor]))
# => {"Robin", "Wright"}

IO.inspect(get_in(cast, [Access.key(:buttercup), :actor]))
# => {"Robin", "Wright"}

IO.inspect(get_in(cast, [Access.key(:buttercup), :actor, Access.elem(1)]))
# => "Wright"

IO.inspect(
  get_and_update_in(cast, [Access.key(:buttercup), :role], fn val ->
    {val, "Queen"}
  end)
)

# => {"princess",
#  %{
#    buttercup: %{actor: {"Robin", "Wright"}, role: "Queen"},
#    westley: %{actor: {"Carey", "Elwes"}, role: "farm boy"}
#  }}
