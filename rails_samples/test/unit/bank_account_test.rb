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

  # codecite overdrawn_simple
  def test_overdrawn_method_should_return_overdrawn_accounts
    od_checking = bank_accounts(:overdrawn_checking)
    od_savings = bank_accounts(:overdrawn_savings)
    assert_equal [od_checking, od_savings], BankAccount.overdrawn.find(:all, :order => 'type asc')
    assert_equal [od_checking], CheckingAccount.overdrawn
    assert_equal [od_savings], SavingsAccount.overdrawn
  end
  # codecite overdrawn_simple
  
  # codecite overdrawn_by
  def test_overdrawn_by_method_should_return_accounts_overdrawn_by_supplied_threshold
    od_checking = bank_accounts(:overdrawn_checking)
    od_savings = bank_accounts(:overdrawn_savings)
    assert_equal [od_checking], BankAccount.overdrawn_by(100)
    assert_equal [od_checking, od_savings], BankAccount.overdrawn_by(50).find(:all, :order => 'type asc')
  end
  # codecite overdrawn_by

  # codecite proxy_options overdrawn_by 
  def test_overdrawn_by_method_should_add_balance_predicate_to_generated_sql
    expected_options = { :conditions => ['balance <= ?', -100] }
    assert_equal expected_options, BankAccount.overdrawn_by(100).proxy_options
  end
  # codecite proxy_options overdrawn_by 

end
