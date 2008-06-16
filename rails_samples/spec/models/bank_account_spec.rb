# codecite class
require File.dirname(__FILE__) + '/../spec_helper'

describe BankAccount do
  fixtures :bank_accounts
  # codecite class

  # codecite test bank account to bank account
  it "should be able to transfer a balance to another BankAccount" do
    small = bank_accounts(:small_checking)
    large = bank_accounts(:large_checking)
    small.balance.should == 1000
    large.balance.should == 20000
    small.transfer(500, large)
    small.balance.should == 500
    large.balance.should == 20500
  end
  # codecite test bank account to bank account
  # codecite test bank account to investment account  
  it "should be able to transfer a balance to an InvestmentAccount" do
    small = bank_accounts(:small_checking)
    large = InvestmentAccount.create!(:owner => "Joe", :balance => 14000)
    small.balance.should == 1000
    large.balance.should == 14000
    small.transfer(500, large)
    small.balance.should == 500
    large.balance.should == 14500    
  end
  # codecite test bank account to investment account

  # codecite test sti counters
  it "should be able to find specific inherited types" do
    actual_savings = ActiveRecord::Base.connection.execute("SELECT id FROM bank_accounts WHERE type = 'SavingsAccount'").num_rows
    ar_savings = SavingsAccount.count
    ar_savings.should == actual_savings
    ar_savings.should < BankAccount.count
  end
  # codecite test sti counters  

  # codecite subclass methods
  it "should only have a calculate_interest method for savings accounts" do
    bank = BankAccount.find(:first)
    checking = CheckingAccount.find(:first)
    savings = SavingsAccount.find(:first)
    bank.should_not respond_to(:calculate_interest)
    checking.should_not respond_to(:calculate_interest)
    savings.should respond_to(:calculate_interest)
    savings.calculate_interest.should == 140.0
  end
  # codecite subclass methods
  
  # codecite overdrawn_simple
  it "should have an overdrawn method for finding overdrawn accounts" do
    od_checking = bank_accounts(:overdrawn_checking)
    od_savings = bank_accounts(:overdrawn_savings)
    BankAccount.overdrawn.should have(2).elements
    BankAccount.overdrawn.should include(od_checking, od_savings)
    CheckingAccount.overdrawn.should == [od_checking]
    SavingsAccount.overdrawn.should   == [od_savings]
  end
  # codecite overdrawn_simple
  
  # codecite overdrawn_by
  it "should have an overdrawn_by method for finding accounts overdrawn by a supplied threshold" do
    od_checking = bank_accounts(:overdrawn_checking)
    od_savings = bank_accounts(:overdrawn_savings)
    BankAccount.overdrawn_by(100).should == [od_checking]
    BankAccount.overdrawn_by(50).should have(2).elements
    BankAccount.overdrawn_by(50).should include(od_checking, od_savings)
  end
  # codecite overdrawn_by

  # codecite proxy_options overdrawn_by 
  it "should set query conditions properly when the overdrawn_by method is called" do
    expected_options = { :conditions => ['balance <= ?', -100] }
    BankAccount.overdrawn_by(100).proxy_options.should == expected_options
  end
  # codecite proxy_options overdrawn_by 

end