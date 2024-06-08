require 'simplecov'
# SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(0)
    @transaction = Transaction.new(5)
    @transaction.amount_paid = 10
  end

  def test_accept_money
    assert_equal(10, @cash_register.accept_money(@transaction))
  end

  def test_change
    assert_equal(5, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $5.\n") { @cash_register.give_receipt(@transaction) }
  end
end