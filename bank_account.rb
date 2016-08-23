module Bank
  class Account

    attr_accessor :withdraw, :deposit, :balance, :new_account, :id

    def initialize(id, balance, message = "Assertion Failed")
      @withdraw = 0
      @deposit = 0
      @balance  = balance
      @new_account = {}
      @id = nil

      if balance > 0
        return true
      else raise Exception.new(message)
      end
    end

     #Alternative way of addding id and balance
    # def new_account(id, balance)
    #   if balance < 0
    #     puts"Sorry you can't create a negative balance!"
    #   else
    #  @new_account[:id] = balance
    #  @balance = balance
    #   end
    # end

    def current_balance
      return @balance
    end

    def withdraw_money(withdraw)
      new_balance = @balance - withdraw
      if new_balance < 0
        puts "Sorry you can't withdraw an amount that is more than your balance!"
        puts @balance
      else
        @balance = new_balance
        return @balance
      end
      return @balance
    end

    def deposit_money(deposit)
      new_balance = @balance + deposit
      @balance = new_balance
      return @balance
    end
  end
end

c = Bank::Account.new("123", 50)
puts c.withdraw_money(70)
puts c.current_balance
puts c.deposit_money(40)
