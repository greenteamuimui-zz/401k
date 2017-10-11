require 'csv'
require_relative 'employee'
require_relative 'portfolio'

class PayrollSystem
  attr_reader :payroll_hash, :census_hash, :employees_on_payroll, :payroll_date
  def initialize
    @employees_on_payroll = []
  end

end
