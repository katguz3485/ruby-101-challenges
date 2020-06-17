class InlineRescue

  # def greet(params)
  #   name = params.fetch(:username) rescue "Anonymous"
  #   puts "Hello #{name}"
  # end

  def greet(params)
    # name = params.fetch(:username) rescue "Anonymous"
    name = user_name(params)
    puts "Hello #{name}"
  end

  def user_name(params)
    "#{params.fetch(:fname)} #{params.fetch(:lname)}" rescue "Anonymous"
  end
end

p = InlineRescue.new
p.greet({})
p.greet({fname: "Albert", lname: "Hoffman"})