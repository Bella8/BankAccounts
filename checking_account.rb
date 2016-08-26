require_relative'bank_account.rb'

class CheckingAccount < Bank::Account

  def initialize(id, balance)
    super(id, balance)
    @check_number = 0
  end

  def withdraw_money(withdraw)
    withdraw += 1
    super
  end

  def withdraw_using_check(withdraw)
    new_balance = @balance - withdraw
    if new_balance < -10
      puts "Sorry you your balnce can't be less than -$10!"
      return @balance
    else
      if @check_number <= 2
        @balance = new_balance
        @check_number += 1
      elsif @check_number > 2
        fine = 2
        @balance = new_balance - fine
        @check_number += 1
      end
      return @balance
    end
  end

  def reset_checks
    @check_number = 0
    return @check_number
  end
end

# Tests
c = CheckingAccount.new("123", 110 )
puts c.withdraw_money(10)  # the withdraw with out the check
puts c.withdraw_using_check(10)
puts c.withdraw_using_check(10)
puts c.withdraw_using_check(10)
puts c.withdraw_using_check(10)
puts c.withdraw_using_check(10)
puts c.withdraw_using_check(10)
puts c.withdraw_using_check(10)
puts c.reset_checks  # reseting check number to zero
puts c.withdraw_using_check(10)
puts c.withdraw_using_check(10)
puts c.withdraw_using_check(14) # Gives you an error message because its more
                                #  the minumum amount
# puts c.withdraw_using_check(11) # No error the exact amount.
# puts c.withdraw_using_check(10)
