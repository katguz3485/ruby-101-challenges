# class App
#   def hiss(*)
#     puts "Scoundrel, I hiss at thee!"
#   end
#
#   def honk(*)
#     puts "HONK HONK, feathermucker!"
#   end
# end
#
# App.new.send(*ARGV)
#
# subcommand, args = *ARGV
# App.new.public_send("do_#{subcommand}", *args)
#
class MailSender
  extend Advice
  around :deliver, wrap: :benchmark

  def initialize(sender:)
    @sender = sender
  end

  def deliver(message, to:)
    send({from: sender, to: to, body: message })
  end

  private
  attr_reader :sender

  def send(envelope)
    puts "SENT to <#{envelope[:to]}>: #{envelope[:body]}"
  end

  def benchmark(method_name)
    start_time = Time.now
    yield
    end_time = Time.now
    puts "#{method_name} executed in #{end_time - start_time}"
  end

end

module Advice
  def around(subject_method, wrap:)
    (@@advice_wrappers ||= {})[subject_method] = wrap
  end

  def method_added(method_name)
    super if defined? super
    return if Thread.current[:advice_in_method_added]
    Thread.current[:advice_in_method_added] = true
    wrapper_name = @@advice_wrappers[method_name]
    if wrapper_name
      original = instance_method(method_name)
      define_method(method_name) do |*args, **kwargs, &block|
        send(wrapper_name, method_name) do
          original.bind(self).call(*args, **kwargs, &block)
        end
      end
    end
  ensure
    Thread.current[:advice_in_method_added] = nil
  end
end

MailSender.new(sender: "example@gmail.com").deliver("Elo", to: "eloelo@gmail.com")
#ENT to <eloelo@gmail.com>: Elo