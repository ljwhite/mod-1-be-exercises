suitcase = {
  "socks" => 4,
  "pants" => 1,
}

suitcase["shirts"] = 3
suitcase["shirts"] += 1
suitcase["swimsuit"] = true

p suitcase
# 1. Add a key/value pair of shirts/3 to the suitcase.
# 2. Increase the value of shirts by 1.
# 3. Add a key/value pair of swimsuit/true to the suitcase.
