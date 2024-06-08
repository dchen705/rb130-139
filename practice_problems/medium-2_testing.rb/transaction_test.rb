# require SimpleCov
# SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'cash_register' # unnecessary
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(20)

    def @transaction.prompt_for_payment(input: $stdin)
      loop do
        puts "You owe $#{item_cost}.\nHow much are you paying?"
        @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
        break if valid_payment? && sufficient_payment?
        puts 'That is not the correct amount. ' \
             'Please make sure to pay the full cost.'
      end
    end

    # def print(input: $stdin)
    #   puts 'this is a test'
    #   x = input.gets.chomp
    #   puts "this is another test, #{x}"
    # end
  end

  def test_prompt_for_payment
    input = StringIO.new("30\n")

    assert_output('a') { @transaction.prompt_for_payment(input: input) }

    assert_equal(0, @transaction.amount_paid)

    # output, _ = capture_io { @transaction.prompt_for_payment(input: input) }
    # assert_equal('', output)

    # assert_output("this is a test\n") { print(input: input) }

  end
end

# after reading other students, they had 2 more rigorous test themes:
# 1) test the entire series of outputs, not just the setter call for @amount_paid
# 2) test the edge cases and their expected behavior
#   a) invalid input - user inputs non-integer
#   b) less than zero
#   c) less than item cost

# 1)
# first let''s check the output of assert_output on this prompt method...
# +"You owe $20.
#         +How much are you paying?
#         +"

# hmm, only the first puts call output was recorded.

# same thing when I try to capture_io

