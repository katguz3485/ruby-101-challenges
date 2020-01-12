require 'humanize'

class MonkeySong

  def initialize(number_of_repetitions)
    @number_of_repetitions = number_of_repetitions
  end

  def monkey_song_sing
    (1..number_of_repetitions).to_a.reverse.each { |x| puts chorus(x) }
  end

  private
  attr_reader :number_of_repetitions

  def chorus(number_of_repetitions)
    "#{number_of_repetitions.humanize.capitalize} little monkeys jumping on the bed,
    One fell off and bumped his head,
    Mama called the doctor and the doctor said,
    No more monkeys jumping on the bed!"
  end



end

ms = MonkeySong.new(10)
puts ms.monkey_song_sing