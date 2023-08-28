fridge_items_1 = ["milk", "eggs", "eggs","eggs", "eggs",
                  "eggs", "eggs", "avocado", "avocado", "tortilla",
                  "tortilla", "tortilla", "tortilla", "tortilla",
                  "tortilla", "tortilla", "tortilla", "tortilla"]

# Looking at the collection above:

# 1. What is problematic about listing `fridge_items_1`
# as an array structured grocery list?

# 2. What might be a more readable way to structure this?

fridge_items = Hash.new(0)

fridge_items_1.each_with_object(fridge_items) do |fruit, hash|
    hash[fruit] += 1
end

p fridge_items