class Task


  attr_reader :name

  def initialize
    @name = name
  end

  def get_time_required
    0.0
  end

end


class AddDryIngredientTask < Task


  def initialize
    super
  end

  def get_time_required
    1.0
  end
end


class MixTask


  def initialize
    super
  end


  def get_time_required
    3.0
  end
end

class MakeBetterTask < Task

  def initialize
    super
    @sub_tasks = []
    add_subtask(AddDryIngredientTask .new )
    add_subtask( MixTask.new )
  end

  def add_subtask(task)
    @sub_tasks << task
  end

  def remove_subtask
    @sub_tasks.delete(task)
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each {|task| time += task.get_time_required}
  end
end


task = MakeBetterTask.new
puts @sub_tasks
puts task.get_time_required
