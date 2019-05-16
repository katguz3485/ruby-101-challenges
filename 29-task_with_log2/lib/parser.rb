require 'csv'
require 'pry'


class Parser
  attr_reader :logs

  def initialize
    @logs = parsed_logs
  end

  def count_visits(logs:, unique_keys: find_unique_keys)
    visits = {}
    unique_keys.each do |x|
      size = logs.map { |hash| hash[x] }.compact.length
      visits.store(x, size)
    end
    sort_visits(visits)
  end

  private

  def parsed_logs
    @logs = []
    CSV.foreach("/home/kasia/RubymineProjects/ruby-101-challenges/29-task_with_log2/log.csv") do |row|
      @logs << parse_row(row)
    end
    @logs
  end

  def parse_row(row)
    row.map { |x| x.split(" ") }.to_h
  end

  def find_unique_keys
    @logs.map { |address_ip_pair| address_ip_pair.keys }.uniq.flatten
  end

  def sort_visits(visits)
    visits.sort_by { |_k, v| v }.reverse.flatten
  end
end

p = Parser.new
puts "The total number of visits #{p.count_visits(logs: p.logs)}"
puts "The unique visits #{p.count_visits(logs: p.logs.uniq)}"
