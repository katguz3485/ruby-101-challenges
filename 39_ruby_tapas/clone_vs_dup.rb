ShoppingList = Struct.new(:name, :items)
MASTERLIST = ShoppingList.new("Master List", ["Bread", "Milk", "Beer"])
today_list = MASTERLIST
today_list.name = "Today list"
today_list.items << "sth"
MASTERLIST.freeze
MASTERLIST.clone
MASTERLIST.frozen?
MASTERLIST.dup
a = MASTERLIST.clone
a.frozen?
#=> true
a = MASTERLIST.dup
a.frozen?
#=> false

class Binding
  def checkpoints
    Thread.current[:binding_checkpoints] ||= []
  end

  def checkpoint
    cp = {}
    local_variables.each do |varname|
      cp[varname] = local_variable_get(varname).dup
    end
    checkpoints.push(cp)
  end

  def undo
    cp = checkpoints.pop
    cp.each do |varname, value|
      local_variable_set(varname, value)
    end
  end

end

duck = Object.new

def duck.speak
  "Quack"
end

puts duck.speak

binding.checkpoint

def duck.move
  "Waddle "
end

puts duck.move

binding.undo