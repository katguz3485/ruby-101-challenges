def names
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesamin"
end

names do |name|
  puts name
  break if name =~ /^S/
end

result = nil
names do |name|
  puts name
  if name =~ /^S/
    result = name
    break
  end
end
result


result = names do |name|
  puts name
  break name if name =~ /^S/
end
result

f = open('071-break-with-value.org')
f.lines.detect do |line|
  line =~ /banana/
end