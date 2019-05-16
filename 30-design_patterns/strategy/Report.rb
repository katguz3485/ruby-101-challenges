require 'HTMLFormatter'
require 'PlainTextFormatter'

class Report

  attr_reader :title, :text
  attr_accessor :formatter


  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['Things are going quite well']
    @formatter = formatter
  end

  def output_report
     @formatter.output_report(@title, @text)
    # passing the context
    # @formatter.output_report(self)
    #
    # def output_report(context)
    # raise 'Abstract method called'
    # end
    #
    # def output_report(context)
    # puts('<html>')
    # puts(' <head>')
    # puts("
    # <title>#{context.title}</title>")
    # puts(' </head>')
    # puts(' <body>')
    # context.text.each do |line|
    # puts("
    # <p>#{line}</p>")
    # end
    # puts(' </body>')
    # puts('</html>')
    # end
    #
  end
end

report = Report.new(HTMLFormatter.new)

puts report.output_report