text = <<END
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec
hendrerit tempor bob@example.com tellus. Donec pretium posuere
tellus. Proin quam nisl, tincidunt et, mattis eget, convallis nec,
purus. Cum sociis natoque penatibus et magnis dis parturient montes,
nascetur sue@example.org ridiculus mus. Nulla posuere. Donec vitae
dolor. Nullam tristique contact@shiprise.net diam non turpis. Cras
placerat accumsan nulla. Nullam president@whitehouse.gov rutrum. Nam
vestibulum accumsan nisl.
END
EMAIL_PATTERN = /\S+@\S+/i

addresses = []
while(match = EMAIL_PATTERN.match(text))
  addresses << match[0]
  text = match.post_match
end
addresses

# => ["bob@example.com",
#     "sue@example.org",
#     "contact@shiprise.net",
#     "president@whitehouse.gov"]
#

addresses = text.scan(EMAIL_PATTERN)
# => ["bob@example.com",
#     "sue@example.org",
#     "contact@shiprise.net",
#     "president@whitehouse.gov"]
#
#
# EMAIL_PATTERN = /(\S+)@(\S+)/i
#
text.scan(EMAIL_PATTERN) do |name, host|
  puts "Name: #{name}, host: #{host}"
end
# >> Name: bob, host: example.com
# >> Name: sue, host: example.org
# >> Name: contact, host: shiprise.net
# >> Name: president, host: whitehouse.gov