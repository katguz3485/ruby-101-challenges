class Api

  def unit_of_measurement_adder(resource, unit)
    resource.concat(" ", unit)
  end

  def molecular_weight_formatter(molecular_weight)
    molecular_weight = molecular_weight.to_s
     unit_of_measurement_adder(molecular_weight, 'g/mol')
  end

  def density_formatter(density)
    density = density.to_s
     unit_of_measurement_adder(density, 'g/mL')
  end

=begin
  def formula_formater(formula)
    formula = formula.to_s
    result = formula.gsub(/(?<=[A-Z|\]])\d+/, '<sub>\0</sub>').gsub(/(?<=\[)\d+/, '<sup>\0</sup>')
    result
  end
=end

  @chemical = Api.new

  puts @chemical.molecular_weight_formatter(132)
  puts @chemical.density_formatter(1.2)

end