class Employee
  attr_reader :f_name, :l_name, :risk

  def initialize(options = {})
    @f_name = options[:f_name]
    @l_name = options[:l_name]
    @ssn = options[:ssn]
    @gross = options[:gross]
    @personal_contribution = options[:personal_contribution]
    @match_contribution = options[:match_contribution]
    @risk = options[:risk]
    calculate_personal_contribution
    calculate_company_contribution
  end

  def calculate_personal_contribution
    (@personal_contribution.to_f/100.00) * @gross.to_f
  end

  def calculate_company_contribution
    (@match_contribution.to_f/100.00) * @gross.to_f
  end
end
