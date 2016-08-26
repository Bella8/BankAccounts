require_relative'bank_account.rb'

class MoneyMarketAccount < Bank::Account
  MIMINUM = 10000
  def initialize(id, balance)
    super
    @transactions = 0
  end

  def withdraw_money(withdraw)
    @balance = @balance - withdraw
      @transactions += 1
    unless @balance >= MIMINUM
      if @balance < MIMINUM
        @balance = @balance - 100
        @transactions = 6
      end
    end
    return @blance
  end

  def deposit_money(deposit)
    super
    unless @balance < MIMINUM
      @transactions += 1
      return @blance
    end
  end

  def exit_transactions
    if @transactions == 6
      exit
    end
  end

  def add_interest(rate)
    interst = @balance * rate/100
    @balance = @balance.to_f + interst.to_f
    return interst
  end

  def reset_transactions
    @transactions = 0
    return @transactions
  end
end

c = MoneyMarketAccount.new("123", 10100 )
puts c.withdraw_money(100)
puts c.current_balance

puts c. deposit_money(100)
puts c.current_balance

puts c.withdraw_money(100)
puts c.current_balance

puts c. deposit_money(100)
puts c.current_balance

puts c.withdraw_money(100)
puts c.current_balance

puts c. deposit_money(100)
puts c.current_balance

puts c.add_interest(0.25)
puts c.current_balance

puts c.exit_transactions

puts c.reset_transactions
