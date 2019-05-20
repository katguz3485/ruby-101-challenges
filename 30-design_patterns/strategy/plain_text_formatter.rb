class PlainTextFormatter < Formatter

  def output_report(tile, text)
    puts("**** #{title}, text")
    text.each do |line|
      puts(line)
    end
  end



end