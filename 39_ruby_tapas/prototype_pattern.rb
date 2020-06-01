class Quiz

  def initialize_copy(original)
    super
    @is_template = false
    @title = @title.dup
    @description = @description.dup
    @teacher_instructions = @teacher_instructions.dup
    @student = @student.dup
    @questions = Array(@questions).map(&:dup)
  end

  attr_accessor :title, :description, :teacher_instructions, :is_template,
                :student, :questions

end


class Question

  def initialize_copy(original)
    @text = @text.dup
    @special_instructions = @special_instructions.dup
    @question_answer = @question_answer.dup
  end

  attr_accessor :text, :special_instructions, :question_answer

end

template = Quiz.new
template.is_template = true
template.title = "quiz"
