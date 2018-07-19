require 'pry'
require_relative "transfer"

class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  @@all_accounts = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @valid = true
    @@all_accounts << self
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    p  "Your balance is $#{self.balance}."
  end

  def valid?
    if  @balance <= 0 || @status == "closed"
      @valid = false
    else
      @valid = true
    end
  end

  def close_account
      self.status = "closed"
  end

  # def self.valid?(sender, receiver)
  #   if sender.valid? == true && receiver.valid? == true
  #     Transfer.valid = true
  #   end
  # end

  # def self.execute_transaction(sender, receiver, amount)
  #   if Transfer.valid == true && Transfer.status != "complete"
  #     sender.balance -= amount
  #     receiver.balance += amount
  #     Transfer.status = "complete"
  #   end
  #
  #   if sender.valid? == false
  #     puts "Transaction rejected. Please check your account balance."
  #     Transfer.status = "rejected"
  #   end
  # end

end
