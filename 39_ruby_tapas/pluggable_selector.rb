class TeaClock

  def initialize(minutes)
    self.ui = StdioUi.new
    self.timer = SleepTimer.new(minutes, ui)
    init_plugins
  end

  def init_plugins
    @plugins = []
    ::Plugins.constants.each do |name|
      @plugins << ::Plugins.const_get(name).new(self)
    end
  end

  def start
    timer.start
  end

  attr_accessor :timer
  attr_accessor :ui

end

SleepTimer = Struct.new(:minutes, :notifier, :notify_message) do
  def start
    sleep minutes * 60
    notifier.public_send(notify_message, "Tea is ready")
  end
end

class StdioUi
  def notify(text)
    puts text
  end
end

module Plugins
  class Beep
    def initialize(tea_clock)
      tea_clock.ui.extend(UiWithBeep)
    end

    module UiWithBeep
      def notify(*)
        puts "Beep"
        super
      end
    end
  end
end

# t = TeaClock.new(0.01).start
# t.start
# t = SleepTimer.new(0.1, $stdout, :puts)
# t.start

Product = Struct.new(:short_name, :long_name)

products = [
    Product.new("JonGldApl", "Jonagold apples from our own orchard"),
    Product.new("PchTrnvr", "Fresh-baked peach turnovers"),
    Product.new("TrkBrs",   "Turkey bruschetta panini")
]

ProductListPresenter = Struct.new(:products, :show_message) do
  def render
    "".tap do |s|
      s << "<ul class='product_list'>\n"
      products.each do |product|
        s << "<li>#{product.public_send(show_message)}</li<>"
      end
      s << "</ul>\n"
    end
  end
end

puts ProductListPresenter.new(products, :short_name).render
puts ProductListPresenter.new(products, :long_name).render