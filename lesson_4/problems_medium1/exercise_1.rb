class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

my_bank = BankAccount.new(1_000_000)
p my_bank.positive_balance?
