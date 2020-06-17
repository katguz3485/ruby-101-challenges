# pandoc -S -o book.epub ch1.md
# ls -l *.epub
# unzip -l book.epub
# unzip -p book.epub content.opf | grep dc:title
# pandoc --epub-metadata=metadata.xml -o book.epub ch1.md
#
#  pandoc --epub-metadata=metadata.xml -o book.epub ch1.md
# [WARNING] This document format requires a nonempty <title> element.
#   Defaulting to 'ch1' as the title.

# tle, use 'title' in metadata or --metadata title="...".
require 'yaml'
require 'erb'
require 'tempfile'

metadata    = YAML.load_file('metadata.yml')
title       = metadata[:title]
description = metadata[:description]

template = ERB.new(<<EOF)
  <dc:title><%= title %></dc:title>
  <dc:description><%= description %></dc:description>
EOF
epub_meta = template.result(binding)

Tempfile.open('epub_metadata') do |meta|
  meta.write(epub_meta)
  meta.close
  args = %W[--epub-metadata=#{meta.path} -o book.epub ch1.md]
  system('pandoc', *args)
end

Tempfile.open('epub_metadata') do |meta|
  puts "Tempfile: #{meta.path}"
  meta.write(epub_meta)
  meta.close
  args = %W[--epub-metadata=#{meta.path} -o book.epub ch1.md]
  system('pandoc', *args)
end