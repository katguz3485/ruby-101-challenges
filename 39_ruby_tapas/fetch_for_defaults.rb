auth = {
    'uid'  => 12345,
    "sth" => nil,
    'info' => {
    }
}

auth['info'].fetch('email') do
  raise "Missing email"
end

auth['info'].fetch('email') { "example@gmail.com" }

email_address = auth['info'].fetch('email')

require 'logger'

class NullLogger
  def method_missing(*); end
end

options = {}
logger = options[:logger] || Logger.new($stdout)
unless logger
  logger = NullLogger.new
end
logger

#{}[:foo] || :default             # => :default
#{foo: nil}[:foo] || :default     # => :default
#{foo: false}[:foo] || :default   # => :default


# {}.fetch(:foo){:default}
# {foo: nil}.fetch(:foo){:default}
# {foo: false}.fetch(:foo){:default}

options =  {logger: false}
logger = options.fetch(:logger){Logger.new($stdout)}
unless logger
  logger = NullLogger.new
end
logger


include_context 'when platform setting are', contributions: {
    validate_total_percentage: false,
    skip_percentages_validation: true
}
