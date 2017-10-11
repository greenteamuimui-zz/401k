require 'csv'
require_relative 'employee'
require_relative 'portfolio'

class PayrollSystem
  attr_reader :payroll_hash, :census_hash, :employees_on_payroll, :payroll_date
  def initialize
    @employees_on_payroll = []
  end

  # This method takes in the two files and initialize instances of
  # the Employee class with the required information to calculate
  # the contribution amounts and shares portfolio
  def run(payroll_file_location, census_file_location)
    payroll_array = CSV.read("#{payroll_file_location.chomp}")
    @payroll_date = payroll_array[1][-2]
    # Titles Hash is a hash made with the index position of the titles of
    # the table so one can index into the right column in case the table's
    # columns comes in a different order
    titiles_hash = Hash.new
    payroll_array[3].each_with_index do |title, idx|
      titiles_hash[title] = idx
    end
    census_array = CSV.read("#{census_file_location.chomp}")
    census_hash = hash_census(census_array)
    # Here we are utilitzing the census hash and the payroll data to
    # create instances of the employees and store them for this payroll instance
    payroll_array[4..-1].each do |row|
      # SSN is the unique identifier to key into the census_hash to collect
      # the data on a specific employee from the census file
      ssn = row[titiles_hash["ssn"]]
      personal_contribution, match_contribution, risk = census_hash[ssn]
      options = {
      f_name:row[titiles_hash["first_name"]],
      l_name:row[titiles_hash["last_name"]],
      ssn:ssn,
      gross:row[titiles_hash["gross"]],
      personal_contribution:personal_contribution,
      match_contribution:match_contribution,
      risk:risk,
      }
      @employees_on_payroll.push(Employee.new(options))
    end
  end

  private
  # This method creates a census hash with the unique SSN for each employee
  # as the key and the values is an array with the contribution percentages and
  # risk factor
  def hash_census(census_array)
    c_titiles_hash = Hash.new
    census_array.first.each_with_index do |title, idx|
      c_titiles_hash[title] = idx
    end
    census_hash = Hash.new
    census_array[1..-1].each do |row|
      raise "SSN missing" unless row[c_titiles_hash["ssn"]]
      identifier = row[c_titiles_hash["ssn"]]
      census_hash[identifier] = [] unless census_hash[identifier]
      # Creates an array with the contribution_rate_pct, match_rate_pct, risk_setting
      census_hash[identifier] = [row[c_titiles_hash["contribution_rate_pct"]],row[c_titiles_hash["match_rate_pct"]],row[c_titiles_hash["risk_setting"]]]
    end
    census_hash
  end

end
