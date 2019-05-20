require_relative "employee.rb"

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def bonus(multiplier)
    get_all_subemployees.map(&:salary).sum * multiplier
  end

  def add_employee(employee)
    @employees << employee
  end

  def get_all_subemployees
    return  [] if employees.empty? 
    
    all_employees = []

    employees.each do |employee|
      all_employees << employee
      all_employees += employee.get_all_subemployees if employee.class == Manager
    end
    all_employees
  end
  
end

bob = Manager.new("Bob","CEO", 10000, nil)
bob.add_employee(Employee.new("robot", "robot", 1, bob))
bob.add_employee(Employee.new("robot", "robot", 1, bob))
bob.add_employee(Employee.new("robot", "robot", 1, bob))
bob.add_employee(Employee.new("robot", "robot", 1, bob))
bob.add_employee(Employee.new("robot", "robot", 1, bob))
superbot = Manager.new("superrobot", "robot", 100, bob)
bob.add_employee(superbot)
superbot.add_employee(Employee.new("robot", "robot", 10, superbot))
superbot.add_employee(Employee.new("robot", "robot", 10, superbot))

p bob.bonus(1).to_s