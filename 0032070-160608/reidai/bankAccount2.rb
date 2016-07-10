class BankAccount2
  def initialize(initial_balance, initial_secret)
    @balance = initial_balance
    @password = initial_secret
  end
  def withdraw(amount, secret)
    if @password == secret
      if @balance >= amount
        @balance -= amount
        @balance
      else
        "Insufficient_funds"
      end
    else
      "Incorrect_password"
    end
  end
  def deposit(amount, secret)
    if @password == secret
      @balance += amount
    else
      "Incorrect_password"
    end
  end
end
