nil || 42
42 && 23

nil or 42
42 and 23

# => 42
# 2.7.1 :432 > 42 && 23
#  => 23
# 2.7.1 :433 >
# 2.7.1 :434 > nil or 42
#  => 42
# 2.7.1 :435 > 42 and 23
#  => 23
#
user = Struct.new(:name).new("Kasia")
user_name = user && user.name
user_name
user_name = user and user.name
user_name

#2.7.1 :436 > user = Struct.new(:name).new("Kasia")
# 2.7.1 :437 > user_name = user && user.name
# 2.7.1 :438 > user_name
#  => "Kasia"
# 2.7.1 :439 > user_name = user and user.name
#  => "Kasia"
#
user = Struct.new(:name).new("Kasia")
name = (user && user.name)
name
(name = user) and user.name
name

#2.7.1 :440 > user_name
#  => #<struct name="Kasia">
# 2.7.1 :441 > user = Struct.new(:name).new("Kasia")
# 2.7.1 :442 > name = (user && user.name)
# 2.7.1 :443 > name
#  => "Kasia"
# 2.7.1 :444 > (name = user) and user.name
#  => "Kasia"
#
:x || :y && nil
:x or :y and nil

#2.7.1 :446 > :x || :y && nil
#  => :x
# 2.7.1 :447 > :x or :y and nil
#  => nil
#
:x || (:y && nil)
(:x or :y) and nil

#2.7.1 :449 > (:x or :y) and nil
#  => nil
# 2.7.1 :450 > :x || (:y && nil)
#  => :x
# 2.7.1 :451 > (:x or :y) and nil
#  => nil