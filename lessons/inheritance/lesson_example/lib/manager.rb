require '../lib/employee'

class Manager < Employee
  attr_reader :base_salary, :per_team_rate, :departments

  def initialize(base_salary, name, id)
    @base_salary = base_salary
    @per_team_rate = 5
    @departments = []
    super(name, id)
  end

  def add_department(dept)
    @departments << dept
  end

  def total_compensation
    @base_salary * @per_team_rate
  end

  def benefits
    [:sick_leave, :health_insurance]
  end

end