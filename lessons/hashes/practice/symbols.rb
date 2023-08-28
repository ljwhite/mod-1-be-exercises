new_tv = {
  "screen size" => 50,
  "price" => 300,
  "brand" => "Samsung"
}

# Remember in Ruby, symbols are basically Strings that can’t change.
# You can recognize a symbol because it starts with a colon :.
# All of the following are symbols:
# :name
# :symbols_can_have_underscores
# :"symbols can be in quotes"

# Lets change the hash above to use symbols instead of strings.
# Syntax symbol with hash rocket:
# create hash here

old_tv = { :screen_size => 50}
p old_tv

# Syntax symbol without hash rocket:
tv = {screen_size: 50}
p tv
# create hash here
