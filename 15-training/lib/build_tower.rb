def build_tower(n)
  array = []
  i = 0
  while i <= n
    string = "*"
    array.push(string * (i + 1))
    i += 1
  end
  array.each do |elem|
    puts elem
  end
end

build_tower(4)

