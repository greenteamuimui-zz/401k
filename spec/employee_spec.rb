require 'rspec'
require 'employee'

describe Employee do
  let(:options) do
    {
      f_name: "Cherry",
      l_name: "Lam",
      ssn:"555555555",
      gross: "5000",
      personal_contribution: "4.5",
      match_contribution:"3",
      risk:"2",
    }
  end
  subject(:employee) {Employee.new(options)}

  describe '#calculate_personal_contribution' do
    it "calculate the personal contribution using the personal contribution pct" do
      expect(employee.calculate_personal_contribution).to eq(225)
    end
  end

  describe '#calculate_company_contribution' do
    it "calculate the company contribution using the match contribution pct" do
      expect(employee.calculate_company_contribution).to eq(150)
    end
  end
end
