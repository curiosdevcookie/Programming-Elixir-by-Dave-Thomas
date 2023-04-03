# Fun things to do with the enum module:

# 1. Create a list of numbers from 1 to 100
our_list = Enum.to_list(1..100)

# 2. Filter out all the odd numbers
filtered_list = Enum.filter(our_list, fn x -> rem(x, 2) == 0 end)

# 3. Double the remaining numbers
filtered_doubled = Enum.map(filtered_list, fn x -> x * 2 end)

# 4. Drop every 5th element
filtered_doubled_dropped = Enum.drop_every(filtered_doubled, 5)

# 5. Shuffle the numbers
filtered_doubled_dropped_shuffled = Enum.shuffle(filtered_doubled_dropped)

# 6. Concat the numbers with a different collection
concat = Enum.concat(filtered_doubled_dropped_shuffled, Enum.to_list(1..3))

# 7. Create sublists with three members each and one sublist of the rest
concatted_three = Enum.chunk_every(concat, 3)

# 8. Diversify the list by adding a member in-between
concatted_three_interspersed = Enum.intersperse(concatted_three, "✳️")

# 9. Count the number of times each member appears in the list
Enum.frequencies_by(concatted_three_interspersed, fn x -> x == "✳️" end)

# 10. Remove all "✳️" from the list
starless = Enum.reject(concatted_three_interspersed, fn x -> x == "✳️" end)

# 11. Flatten the list
starless_flattened = Enum.flat_map(concatted_three_interspersed, fn x -> x end)

# 12. Select every nth element:
Enum.map_every(starless_flattened, 2, fn x -> x * 2 end)

# 13. Return the minimum and maximum elements
starless_flattened_minmax = Enum.min_max(starless_flattened)
