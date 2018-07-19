require_relative "bank_account"

class Transfer
  # your code here
  attr_reader :amount, :sender, :receiver
  attr_accessor :valid, :status

  @@all_transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @valid = false
    @@all_transfers << self
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      self.valid = true
    end
  end

  def execute_transaction
    if self.valid? == true && self.status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    end

    if sender.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
