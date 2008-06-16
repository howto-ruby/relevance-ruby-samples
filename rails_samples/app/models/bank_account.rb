# codecite class
class BankAccount < ActiveRecord::Base
  # codecite overdrawn_simple
  named_scope :overdrawn, :conditions => "balance < 0"
  # codecite overdrawn_simple
  # codecite overdrawn_by
  named_scope :overdrawn_by, lambda {|threshold|
    { :conditions => ["balance <= ?", -threshold] }
  }
  # codecite overdrawn_by
  
  def transfer(amount, account)
    BankAccount.transaction do 
      account.class.transaction do 
        self.balance = self.balance - amount
        account.balance = account.balance + amount
        account.save!
        self.save!
      end
    end
  end
  
end
# codecite class