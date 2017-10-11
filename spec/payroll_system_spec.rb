require 'rspec'
require 'payroll_system'

describe PayrollSystem do
  subject(:payroll_system) {PayrollSystem.new}

  describe '#intialize' do
    it "initialize an instance with an empty employees on payroll store" do
      expect(payroll_system.employees_on_payroll).to eq([])
    end
  end

  describe '#run' do
    before(:each) do
      payroll_system.run("data/payroll_test.csv","data/census_1498456690.csv")
    end
    it "takes in the census and payroll files and store a payroll date" do
      expect(payroll_system.payroll_date).to eq("05-20-2017")
    end

    it "creates new instances of employees add to the store" do
      expect(payroll_system.employees_on_payroll).to include(Employee)
    end
  end

  describe '#print_employees_contriubutions' do
    it "print the employee's contribution" do
      payroll_system.run("data/payroll_test.csv","data/census_1498456690.csv")
      expect{payroll_system.print_employees_contriubutions}.to output("Jenny Nguyen, esq's personal contribution for the month is 200.00\n").to_stdout
    end
  end

  describe '#print_total_company_contribution' do
    it "print the company's total contribution" do
      payroll_system.run("data/payroll_test.csv","data/census_1498456690.csv")
      expect{payroll_system.print_total_company_contribution}.to output("The total company contribution is 200.00\n").to_stdout
    end
  end
end
