require_relative'bank_account.rb'

class SavingsAccount < Bank::Account
  MIMINUM = 10
  def initialize(id, balance)
    super
    @transactions = 0 
  end

  def add_interest(rate)
    interst = @balance * rate/100
    @balance = @balance.to_f + interst.to_f
    return interst
  end

  def withdraw_money(withdraw)
    withdraw += 2
    super
  end

end


c = SavingsAccount.new("123", 14 )  # To see the interst with out an error message
# c= SavingsAccount.new("123", 12 )
puts c.withdraw_money(1) # Gives an error if the inital balance is 12
# message because 1 + 2 fee is $3
puts c.current_balance
puts c.deposit_money(40)
puts c.add_interest(0.25)
puts c.current_balance
