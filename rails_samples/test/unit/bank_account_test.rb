#codecite class
require File.dirname(__FILE__) + '/../test_helper'

class BankAccountTest < Test::Unit::TestCase
  fixtures :bank_accounts
  #codecite class
  
  # codecite test bank account to bank account
  def test_can_transfer_to_bank_account
    small = bank_accounts(:small_checking)
    large = bank_accounts(:large_checking)
    assert_equal 1000, small.balance
    assert_equal 20000, large.balance
    small.transfer(500, large)
    assert_equal 500, small.balance
    assert_equal 20500, large.balance
  end
  # codecite test bank account to bank account

  # codecite test bank account to investment account 
  def test_can_transfer_to_investment_account 
    small = bank_accounts(:small_checking)
    large = InvestmentAccount.create!(:owner => "Joe", :balance => 14000)
    assert_equal 1000, small.balance
    assert_equal 14000, large.balance
    small.transfer(500, large)
    assert_equal 500, small.balance
    assert_equal 14500, large.balance
  end
  # codecite test bank account to investment account

  # codecite test sti counters
  def test_can_find_specific_inherited_types
    expected_savings = ActiveRecord::Base.connection.execute("SELECT id FROM bank_accounts WHERE type = 'SavingsAccount'").num_rows
    ar_savings = SavingsAccount.count
    assert_equal expected_savings, ar_savings
    assert BankAccount.count > ar_savings
  end
  # codecite test sti counters  

  # codecite subclass methods
  def test_only_savings_accounts_have_calculate_interest_method
    bank = BankAccount.find(:first)
    checking = CheckingAccount.find(:first)
    savings = SavingsAccount.find(:first)
    assert !bank.respond_to?(:calculate_interest)
    assert !checking.respond_to?(:calculate_interest)
    assert_respond_to savings, :calculate_interest
    assert_equal 140.0, savings.calculate_interest
  end
  # codecite subclass methods

end
