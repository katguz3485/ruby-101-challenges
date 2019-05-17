class EmployeeObserver2

  attr_reader :name, :title
  attr_reader :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
      # it tells that salary has changed on Employye object
    end
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end
end

class Payroll

  def update(changed_employee)
    puts "Cut a new check for #{changed_employee.name}!"
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class TaxMan
  def update(changed_employee)
    puts ("Send #{changed_employee.name } a new tax bill")
  end
end

fred = EmployeeObserver2.new("Fred", "salary updates", 3000.0)
payroll = Payroll.new
puts fred.add_observer(payroll)
puts fred.salary

tax_man = TaxMan.new

 fred.add_observer(tax_man)
fred.delete_observer(payroll)
puts fred.salary = 9000

