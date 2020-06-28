Runner = Struct.new(:name, :time)

RUNNERS = [
    Runner.new("Catherine Ndereba", 8327),
    Runner.new("Paula Radcliff", 8125),
    Runner.new("Naoko Takahashi", 8386)
]


RUNNERS.map(&:time)
RUNNERS.map(&:time).min

# 2.7.1 :076 > RUNNERS.map(&:time)
# => [8327, 8125, 8386]
# 2.7.1 :077 > RUNNERS.map(&:time).min
# => 8125
# 2.7.1 :078#
#
RUNNERS.sort_by(&:time)
# => [#<struct Runner name="Paula Radcliff", time=8125>,
#     #<struct Runner name="Catherine Ndereba", time=8327>,
#     #<struct Runner name="Naoko Takahashi", time=8386>]

RUNNERS.sort_by(&:time).first

RUNNERS.min_by(&:time)

RUNNERS.max_by{ |r| r.name.size }

caffeine = {
    "coffee"   => 200,
    "espresso" => 75,
    "tea"      => 70
}

caffeine.min_by(&:last)
#2.7.1 :084 > caffeine.min_by(&:last)
#  => ["tea", 70]