require_relative '../strategy/HTMLFormatter'

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
  end
end

report = Report.new(HTMLFormatter.new)

puts report.output_report