str = "String Subscript Assignment"
str[0,0] = "107 "

#2.7.1 :308 > str = "String Subscript Assignment"
# 2.7.1 :309 > str[0,0] = "107 "
# 2.7.1 :310 > _
#  => "107 "
# 2.7.1 :311 > str
#  => "107 String Subscript Assignment"
#
str = "107 String Subscript Assignment"
str[4,0] = "Fun with "
str
#2.7.1 :314 > str
#  => "107 Fun with String Subscript Assignment"
#
# => "107 Fun with String Subscript Assignment"
# 2.7.1 :315 > '107 String Subscript Assignment'[/^\d{3}/]
# => "107"
str = '107 String Subscript Assignment'
str[/^\d{3}/] = 'XXX'
str
# 2.7.1 :318 > str
# => "XXX String Subscript Assignment"
#
str = '107 String Subscript Assignment'
str[/^(\d{3}) (.*)/, 2] = 'How cool is this??'
str

# => "XXX String Subscript Assignment"
# 2.7.1 :319 > str = '107 String Subscript Assignment'
# 2.7.1 :320 > str[/^(\d{3}) (.*)/, 2] = 'How cool is this??'
# 2.7.1 :321 > str
# => "107 How cool is this??"
str = '107 String Subscript Assignment'
str[/^(?<number>\d{3}) (?<title>.*)/, :title] = "It's crazy cool!"
str

#2.7.1 :324 > str
#  => "107 It's crazy cool!"