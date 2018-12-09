#rite Ruby program to get ruby version with patch number.
puts "Ruby Version: " + RUBY_VERSION
puts "Ruby Patch Level: " + RUBY_PATCHLEVEL.to_s

#3. Write a Ruby program to create a new string which
# is n copies of a given string where n is a non-negative integer.
def copyString(n, string)
  string * n + "\n"
end

puts copyString(10, 'a')

#Write a Ruby program to
# display the current date and time
def current_date
  date = Time.now.strftime("%d/%m/%Y %H:%M")
  puts "Current date and Time: " "#{date}"
end

puts current_date

#Write a Ruby program which accept the
# radius of a circle from the user and compute the parameter and area.
def radius_calc
  puts "Enter the radius value"
  radius = gets.to_f
  pi = Math::PI
  perimeter = 2 * pi * radius
  area = pi * radius ** 2
  puts "Input the radius of the circle: #{radius}"
  puts "The perimeter is #{perimeter}"
  puts "The area is #{area}"

end


#radius_calc

# Write a program to
# print the multiply of decimal numbers.
def multiply
  puts "enter first number "
  a = gets.to_f
  puts "enter second numb4
er"
  b = gets.to_f
  result = a * b
  puts result

end

multiply


#Write a Ruby program which accept the user's first and last
# name and print them in reverse order with a space between them.



def reversed_fullname
  puts "enter a first name"
  first_name = gets.chomp
  puts "enter a second name"
  second_name = gets.chomp
  puts "#{second_name} #{first_name}"
end

reversed_fullname


# Write a Ruby program to accept a filename
# from the user print the extension of that.
# Output:
# File name: test.rb
# Base name: test
# Extention: .rb
# Path name: /user/system


def extension_of_file
  puts "enter a filename"
  name = gets.chomp
  # add regex paterns
  regex1 = ""
  regex2 = ""
  base_name = name.gsub(regex1, '')
  extension_of_file = name.gsub(regex2, "")
  puts base_name
  puts extension_of_file
end

extension_of_file


#Write a Ruby program to check three numbers and return true if
# one or more of them are small. A number is called "small"
# if it is in the range 1..10 inclusive.

def number_value_checker(number)
  if number >= 1 && number <= 10
    puts true
  else
    puts false
  end

end

puts number_value_checker(5)
puts number_value_checker(10)
puts number_value_checker(12)


def new_string_create(string)

  if string.contains(string, "if")
    string
  else
    string = "if" + string
  end
  puts string
end

puts new_string_create("ifMyStringContainsIf")


puts new_string_create("ifMyStringContainsIf")
puts new_string_create("myString DoesNotHaveIt")



