require 'pry'
require 'pp'

class ListNames
  def list names
    arr = []
    last_elem = []
    return '' if names.empty?
    return names.map {|x| x.values}.join('') if names.size == 1
    names.each do |hash|
      values = hash.values.join('')
      arr << values
    end
    arr
    last_elem << arr.last
    last_elem
    arr.pop
    "#{arr.join(', ')} & #{last_elem.join("")}"
  end
end

ln = ListNames.new
puts ln.list([{name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'}])
puts ln.list([])
puts ln.list([ {name: 'Bart'}, {name: 'Lisa'} ])