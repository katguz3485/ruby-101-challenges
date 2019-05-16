def crush_game(word)
  regex = /((.)\2{2,})/
  i = word.length
  while i >= 3 && word.match(regex)
    word = word.gsub(regex, '')
    i -= 1
  end
  word
end

Sample Tests:
def crush_game1(word)
  regex = /((.)\2{2,})/

  word = word.gsub(regex, '') while word.match(regex)
  word
end



p crush_game1("AABBCCCCBDDDADB")

