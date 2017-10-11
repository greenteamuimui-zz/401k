class Portfolio
  attr_reader :symbol_price_hash, :risk_hash

  def initialize(risk_symbol_location, symbol_price_location)
    risk_symbol_array = CSV.read("#{risk_symbol_location.chomp}")
    symbol_price_array = CSV.read("#{symbol_price_location.chomp}")
    @symbol_price_hash = hash_symbol_price(symbol_price_array)
    @risk_hash = hash_portfolio_split(risk_symbol_array)
  end

  def employee_portfolio(risk, total)
    portfolio = []
    risk = risk.to_s
    selected_risk_hash = @risk_hash[risk]
    selected_risk_hash.each do |k,v|
      shares_value = total * (v.to_f/100.00)
      raise "Price is missing" unless @symbol_price_hash[k]
      number_of_shares = shares_value/(@symbol_price_hash[k].to_f)
      # I made the assumption that partial shares is allowed and wasn't
      # quite sure what "portfolio value" meant the total of the portfolio
      portfolio.push([k,'%.2f' % shares_value, v,'%.2f' % number_of_shares,'%.2f' % total])
    end
    portfolio
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
