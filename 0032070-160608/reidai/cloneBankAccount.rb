class BankAccount
  def clone
    BankAccount.new(@balance)
  end
end
