require 'pp'

def perimeter(diameter)
  Math::PI * diameter
end

pp perimeter(5)

def side_length(perimeter)
  perimeter / 4.0
end

pp side_length(18)


def side_length2(area)
  Math.sqrt(area)
end

pp side_length2(121)