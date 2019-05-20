class PlainTextFormatter

  def output_report(context)
    puts("**** #{title}, text")
    text.each do |line|
      puts(line)
    end
  end



end