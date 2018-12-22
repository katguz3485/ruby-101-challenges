class Euklidean

  #returns the greatest common divisor

  def euklidean_algorihtm(num1, num2)
    while num1 != num2
      if num1 > num2
        num1 = num1 - num2
      else
        num2 = num2 - num1
      end
    end
    puts num1
  end


  euklidean = Euklidean.new
  euklidean.euklidean_algorihtm(3, 3)

end