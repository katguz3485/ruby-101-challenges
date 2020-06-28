expr = [:*, 3, [:+, 2, 5]]
# 2.7.1 :004 > expr = [:*, 3, [:+, 2, 5]]
# 2.7.1 :005 > op, f1, f2 = expr
# 2.7.1 :006 > op
#  => :*
# 2.7.1 :007 > f1
#  => 3
# 2.7.1 :008 > f2
#  => [:+, 2, 5]
#
expr = [:*, 3, [:+, 2, 5]]
inner_op, t1, t2 = f2

#2.7.1 :015 > expr = [:*, 3, [:+, 2, 5]]
# 2.7.1 :016 > inner_op, t1, t2 = f2
# 2.7.1 :017 > inner_op
#  => :+
# 2.7.1 :018 > t1
#  => 2
# 2.7.1 :019 > t2
#  => 5

expr = [:*, 3, [:+, 2, 5]]
op, f1, (inner_op, t1, t2) = expr

#2.7.1 :022 > op
#  => :*
# 2.7.1 :023 > f1
#  => 3
# 2.7.1 :024 > inner_op
#  => :+
# 2.7.1 :025 > t1
#  => 2
# 2.7.1 :026 > t2
#  => 5
#
menu = {
    'Jacked Up Turkey'     => '$7.25',
    'New York Mikey'       => '$7.25',
    'Apple Grilled Cheese' => '$5.25'
}

menu.each_with_index do |*args|
  puts args.inspect
end

#[["Jacked Up Turkey", "$7.25"], 0]
# [["New York Mikey", "$7.25"], 1]
# [["Apple Grilled Cheese", "$5.25"], 2]
#  => {"Jacked Up Turkey"=>"$7.25", "New York Mikey"=>"$7.25", "Apple Grilled Cheese"=>"$5.25"}

menu.each_with_index do |pair, i|
  name, price = pair
  puts "#{i+1}: #{name} (#{price})"
end

#1: Jacked Up Turkey ($7.25)
# 2: New York Mikey ($7.25)
# 3: Apple Grilled Cheese ($5.25)
#  => {"Jacked Up Turkey"=>"$7.25", "New York Mikey"=>"$7.25", "Apple Grilled Cheese"=>"$5.25"}
#
menu = {
    'Jacked Up Turkey'     => '$7.25',
    'New York Mikey'       => '$7.25',
    'Apple Grilled Cheese' => '$5.25'
}

menu.each_with_index do |(name, price), i|
  puts "#{i+1}: #{name} (#{price})"
end

# /1: Jacked Up Turkey ($7.25)
# 2: New York Mikey ($7.25)
# 3: Apple Grilled Cheese ($5.25)