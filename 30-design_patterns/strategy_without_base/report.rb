require_relative '../strategy_without_base/HTMLFormatter'
require_relative '../strategy_without_base/PlainTextFormatter'

class Report

  attr_reader :title, :text
  attr_accessor :formatter


  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['Things are going quite well']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(self)
  end
end

report = Report.new(HTMLFormatter.new)
puts report.output_report