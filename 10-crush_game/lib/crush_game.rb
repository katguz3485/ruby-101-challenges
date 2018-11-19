def crush_game(word)
  regex = /((.)\2{2,})/
  i = word.length
  while i >= 3 && word.match(regex)
    word = word.gsub(regex, '')
    i -= 1
  end
  word
end

def crush_game1(word)
  regex = /((.)\2{2,})/

  while word.match(regex)
    word = word.gsub(regex, '')
  end
  word
end



p crush_game1("AABBCCCCBDDDADB")

