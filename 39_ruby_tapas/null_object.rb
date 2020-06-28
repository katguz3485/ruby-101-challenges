require 'logger'

class Picard
  def make_it_so(log = Logger.new($stdout))
    log.info "I have instructed engineering to fix my tea kettle"
    Geordi.new(log).fix_it
  end
end


class Geordi
  def initialize(log)
    @log = log
  end

  def fix_it
    @log.info "Reversing the flux phase capacitance!"
    @log.info "Bounding a tachyon particle beam off of Data's cat!"
    Barclay.new(@log).monitor_sensors
  end
end

class Barclay
  def initialize(log)
    @log = log
  end

  def monitor_sensors
    @log.warn "Warning, bogon levels are rising!"
  end
end

Picard.new.make_it_so
# I, [2020-06-28T20:24:01.420761 #84846]  INFO -- : I have instructed engineering to fix my tea kettle
# I, [2020-06-28T20:24:01.420824 #84846]  INFO -- : Reversing the flux phase capacitance!
# I, [2020-06-28T20:24:01.420849 #84846]  INFO -- : Bounding a tachyon particle beam off of Data's cat!
# W, [2020-06-28T20:24:01.420872 #84846]  WARN -- : Warning, bogon levels are rising!
# => true
# #
#
class Picard
  def make_it_so(log = Logger.new($stdout))
    log.info "I have instructed engineering to fix my tea kettle"
    Geordi.new(log, quiet: true).fix_it
  end
end

class Geordi
  def initialize(log, quiet: true)
    @log = log
  end
end

class NullLogger
  def debug(*); end
  def info(*); end
  def warn(*); end
  def error(*); end
  def fatal(*); end
end

log = NullLogger.new

puts "before"
Picard.new.make_it_so(log)
puts "after"