class Foo
  attr_reader :read_only_attribute
  attr_writer :write_only_attribute
  attr_accessor :read_write_attribute
end

require 'logger'

class MyLib
  class << self
    attr_accessor :logger
  end
end

MyLib.logger = Logger.new($stderr)
#
class MyLib
  def self.logger
    @logger
  end

  def self.logger=(new_logger)
    @logger = new_logger
  end
end

MyLib.logger = Logger.new($stderr)

require 'active_support/core_ext'
require 'logger'

class MyLib
  cattr_accessor(:logger) { Logger.new($stderr) }
end

MyLib.logger

obj = MyLib.new
obj.logger

#2.7.1 :298 > require 'logger'
#  => true
# 2.7.1 :299 >
# 2.7.1 :300 > class MyLib
# 2.7.1 :301 >   cattr_accessor(:logger) { Logger.new($stderr) }
# 2.7.1 :302 > end
#  => [:logger]
# 2.7.1 :303 >
# 2.7.1 :304 > MyLib.logger # => #<Logger:0x0000000147d1e0 @progname=nil,
# @level=0, @default_formatter=#<Logger::Formatter:0x0000000147d190 @date
# ime_format=nil>, @formatter=#<Logger::SimpleFormatter:0x0000000147d0a0
# datetime_format=nil>, @logdev=#<Logger::LogDevice:0x0000000147d140 @shi
# t_size=nil, @shift_age=nil, @filename=nil, @dev=#<IO:<STDERR>>, @mutex=
# <Logger::LogDevice::LogDeviceMutex:0x0000000147d118 @mon_owner=nil, @mo
# _count=0, @mon_mutex=#<Mutex:0x0000000147d0c8>>>>
#  => #<Logger:0x00007fb13f979800 @level=0, @progname=nil, @default_formatter=#<Logger::Formatter:0x00007fb13f9797d8 @datetime_format=nil>, @formatter=nil, @logdev=#<Logger::LogDevice:0x00007fb13f979738 @shift_period_suffix=nil, @shift_size=nil, @shift_age=nil, @filename=nil, @dev=#<IO:<STDERR>>, @binmode=false, @mon_data=#<Monitor:0x00007fb13f979508>, @mon_data_owner_object_id=14580>>
# 2.7.1 :305 >
# 2.7.1 :306 > obj = MyLib.new
# 2.7.1 :307 > obj.logger
#  => #<Logger:0x00007fb13f979800 @level=0, @progname=nil, @default_formatter=#<Logger::Formatter:0x00007fb13f9797d8 @datetime_format=nil>, @formatter=nil, @logdev=#<Logger::LogDevice:0x00007fb13f979738 @shift_period_suffix=nil, @shift_size=nil, @shift_age=nil, @filename=nil, @dev=#<IO:<STDERR>>, @binmode=false, @mon_data=#<Monitor:0x00007fb13f979508>, @mon_data_owner_object_id=14580>>