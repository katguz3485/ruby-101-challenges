
def filter_list(l)
 # words.split().sort_by {|w| w.chars.min }.join(" ")
 # words.split().sort_by {|w| w[/[^\d]/]}.join(" ")
  words.split(' ').sort_by {|s| s.gsub(/\D/, '').to_i}.join(' ')

end



p filter_list("is2 Thi1s T4est 3a")



