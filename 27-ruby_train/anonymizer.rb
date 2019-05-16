require 'pp'

# * aaa@aaa.com -> ...@aaa.com
# * aaa@aaa.aaa.com -> ...@aaa.aaa.com

# to train ruby arrays

class Anonymizer
  def anonymize(text)
    replace = []
    text.each_char do |char|
      replace << char.sub(char, ".")
      replace.pop if char.include?("@")
      break if char.include?("@")
    end
    arr =  text.split("").drop(replace.length)
    text = (replace << arr).flatten!.join("")
    text
   end


  aa = Anonymizer.new
  pp aa.anonymize("aaa@aaa.com ")
end
