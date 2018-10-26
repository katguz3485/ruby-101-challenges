def palindrome?(word)
  word.downcase!
  if word.length == 1 || word.length == 0
    true
  else
    if word[0] == word[-1]
      palindrome?(word[1..-2])
    else
      false
    end
  end
end
# To see the result of this method you can uncomment the line below:
  puts palindrome?("Stats")
