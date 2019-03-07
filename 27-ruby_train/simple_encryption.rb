#For the Latin alphabet, this could be mapped as:
require 'pp'
require 'pry'
# A|B|C|D|E|F|G|H|I|J|K|L|M
# Z|Y|X|W|V|U|T|S|R|Q|P|O|N
# א|ב|ג|ד|ה|ו|ז|ח|ט|י|כ
# ת|ש|ר|ק|צ|פ|ע|ס|נ|מ|ל
#
class Cipher


  def initialize(abc)
    @abc = abc
  end

  def encode(str)
    str.tr @abc, @abc.reverse
  end

  alias_method :decode, :encode


end
c = Cipher.new("abc")
puts c.encode("cda")
puts c.decode(c.encode("cda"))