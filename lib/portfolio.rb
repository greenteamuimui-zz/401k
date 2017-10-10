class Portfolio
  attr_reader :symbol_price_hash, :risk_hash

  def initialize(risk_symbol_location, symbol_price_location)
    risk_symbol_array = CSV.read("#{risk_symbol_location.chomp}")
    symbol_price_array = CSV.read("#{symbol_price_location.chomp}")
    @symbol_price_hash = hash_symbol_price(symbol_price_array)
    @risk_hash = hash_portfolio_split(risk_symbol_array)
  end


  private
  def hash_symbol_price(symbol_price_array)
    price_hash = Hash.new
    symbol_price_array[1..-1].each do |row|
      price_hash[row[0]] = row[-1]
    end
    price_hash
  end

  def hash_portfolio_split(risk_symbol_array)
    risk_split_hash = Hash.new
    # Creating a hash with the risk factor being the key and the shares name
    # and percentages as another hash with name => percentage
    risk_symbol_array[1..-1].each do |row|
      risk_factor = row[0]
      risk_split_hash[risk_factor] = Hash.new unless risk_split_hash[row[0]]
      risk_split_hash[risk_factor][row[1]] = row[2]
    end
    risk_split_hash
  end
end
