require "../lib/employee"

class Intern < Employee
  attr_reader :base_salary
  
  def initialize(base_salary,name,id)
    @base_salary = base_salary
    super(name,id)
  end

  def get_coffee
    "Who got the latte?"
  end

  def benefits
    super << :gets_to_get_me_coffee
  end

end