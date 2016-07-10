class BankAccount
  def initialize(initial_balance)
    @balance = initial_balance
  end
  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
      @balance
    else
      "Insufficient_funds"
    end
  end
  def deposit(amount)
    @balance += amount
  end
end
