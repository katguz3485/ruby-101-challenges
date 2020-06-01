# class Dictionary
#   def initialize(dict_path)
#     @dict_path = dict_path
#   end
#
#   def anagrams_for(word)
#     word.downcase.chars.to_a.permutation.select do |perm|
#       perm_word = perm.join
#       IO.foreach(@dict_path).any?{|dict_word|
#         dict_word.downcase.chomp == perm_word.downcase
#       }
#     end.map(&:join).uniq
#   end
# end
#
# dict = Dictionary.new("/usr/share/dict/words")
#
# require 'benchmark'
#
# Benchmark.bm { |bm|
#   bm.report("1st call:") { dict.anagrams_for("avdi") }
#   bm.report("2nd call:") { dict.anagrams_for("avdi") }
# }


class Dictionary
def initialize(dict_path)
  @dict_path = dict_path
end

def anagrams_for(word)
  @memoized_anagrams ||= {}
  if @memoized_anagrams.key?(word)
    return @memoized_anagrams[word]
  end
  results = word.downcase.chars.to_a.permutation.select do |perm|
    perm_word = perm.join
    IO.foreach(@dict_path).any?{|dict_word|
      dict_word.downcase.chomp == perm_word.downcase
    }
  end.map(&:join).uniq
  @memoized_anagrams[word] = results
  results
end
end

dict = Dictionary.new("/usr/share/dict/words")

require 'benchmark'
Benchmark.bm { |bm|
  bm.report("1st call:") { dict.anagrams_for("avdi") }
  bm.report("2nd call:") { dict.anagrams_for("avdi") }
}