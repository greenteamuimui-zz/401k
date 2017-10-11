require 'rspec'
require 'csv'
require 'portfolio'

describe Portfolio do
  let(:risk_symbol_location) do
    "data/risk_symbol.csv"
  end
  let(:symbol_price_location) do
    "data/symbol_price.csv"
  end
  subject(:portfolio) {Portfolio.new(risk_symbol_location,symbol_price_location)}

  describe '#initialize' do
    it "made hash with the risk symbol array and stores it" do
      expect(portfolio.risk_hash).not_to be_empty
    end

    it "made hash with the symbol price hash and stores it" do
      expect(portfolio.symbol_price_hash).not_to be_empty
    end
  end

  describe '#employee_portfolio' do
    it "calculate the portfolio using risk and total and returns a array of arrays with each share's info" do
      expect(portfolio.employee_portfolio(1, 1000)).to eq([["VFIAX", "300.00", "30", "28.79", "1000"], ["VTSAX", "300.00", "30", "14.84", "1000"], ["VGSLX", "400.00", "40", "336.13", "1000"]])
    end
  end

end
