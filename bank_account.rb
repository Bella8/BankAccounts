# require_relative 'owner'
require 'csv'
module Bank
  class Account
    MIMINUM = 0
    attr_accessor :balance, :id, :min #,:open_date
    def initialize(id, balance)
      # # wave two
      # def initialize(id, balance, open_date)

      @id = id
      @balance  = balance

      # Wave two
      # @open_date = open_date

      unless @balance > self.class::MIMINUM
        message = "Assertion Failed"
        raise Exception.new(message)
      end
    end

    def current_balance
      return @balance
    end

    def withdraw_money(withdraw)
      new_balance = @balance - withdraw
      if new_balance < self.class::MIMINUM
        puts "Sorry you can't withdraw an amount that is more than your balance!"
        return @balance
      else
        return @balance = new_balance
      end
    end

    def deposit_money(deposit)
      new_balance = @balance + deposit
      @balance = new_balance
      return @balance
    end

    #  Wave two
    def self.all
      account_info = []
      CSV.read('support/accounts.csv').each do |line|
        id = line[0].to_i
        balance = line[1].to_i
        open_date = line[2].to_i
        #arrays of arrays
        account_info<< self.new(id, balance, open_date)
      end
      return account_info
    end

    def self.find(id)
      self.all.each do |line|
        #id is at zero index
        if line.id == id
          return line
        end
      end
    end
  end
end


# test for wave two
# accounts = Bank::Account.all
# account = Bank::Account.find(1214)
# p account
# puts accounts



# Tests
# c = Bank::Account.new("123", 9 )
# # c = Bank::Account.new("123", 8 ) # Set to see an error message of the balence been to low
# # c = Bank::Account.new("123", 0 )    #Exception failed message
# puts c.withdraw_money(9)
# puts c.withdraw_money(8)
# puts c.current_balance
# puts c.deposit_money(40)
