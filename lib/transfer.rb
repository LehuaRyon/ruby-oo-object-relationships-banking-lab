class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end
  def valid?
    sender.valid? && receiver.valid?
  end
  def execute_transaction
    if valid? && (sender.balance > self.amount) && (self.status == "pending")
      # sender.balance -= self.amount
      # receiver.balance += self.amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end  
  end  
end
