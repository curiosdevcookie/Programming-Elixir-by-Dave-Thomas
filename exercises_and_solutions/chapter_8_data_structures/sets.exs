# SETS

set1 = 1..5 |> Enum.into(MapSet.new())
# => #MapSet<[1, 2, 3, 4, 5]>
set2 = 3..7 |> Enum.into(MapSet.new())
# => #MapSet<[3, 4, 5, 6, 7]>

# Union
MapSet.union(set1, set2)
# => #MapSet<[1, 2, 3, 4, 5, 6, 7]>

# Intersection
MapSet.intersection(set1, set2)
# => #MapSet<[3, 4, 5]>

# Difference
MapSet.difference(set1, set2)
# => #MapSet<[1, 2]>

MapSet.difference(set2, set1)
# => #MapSet<[6, 7]>

MapSet.difference(set2, set2)
# => #MapSet<[]>
