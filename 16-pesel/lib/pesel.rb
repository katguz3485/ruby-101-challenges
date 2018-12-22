class Pesel

  def ask_for_pesel
    puts "Enter a pesel number"
    return gets.to_i
  end

  def pesel_to_array(pesel)
    p = pesel.digits.reverse
    p
  end

  def pesel_valid?(pesel)
    p = pesel_to_array(pesel)
    sum = (p[0].to_i + p[4].to_i + p[8].to_i) * 9 + (p[1].to_i + p[5].to_i + p[9].to_i) * 7 + (p[2].to_i + p[6].to_i) * 3 + p[3].to_i + p[7].to_i
    if sum % 10 == p.last
      info = "Pesel number is correct"
    else
      info = "Pesel number is not correct"
    end
    info
  end


  def date_of_birth(pesel)
    p = pesel_to_array(pesel)
    day = "#{p[4]}#{p[5]}"
    month = "#{p[2]}#{p[3]}"
    year = "#{p[0]}#{p[1]}"

    month = month.to_i
    after_2000 = 19

    if month > 20
      month = month - 20
      after_2000 += 1
    end

    date = "#{day}-#{month}-#{after_2000}#{year}"
    puts "Date of brith: #{date}"
    date
  end

  def what_sex(pesel)
    p = pesel_to_array(pesel)
    sex_designator = p[9].to_i
    if sex_designator.even?
      sex = "female"
    else
      sex = "male"
    end
    sex
  end

  subject = Pesel.new
  pesel = subject.ask_for_pesel
  subject.pesel_to_array(pesel)
  puts subject.pesel_valid?(pesel)
  puts subject.what_sex(pesel)
  puts subject.date_of_birth(pesel)


end