# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

# def compute
#   if block_given?
#     yield
#   else
#     'Does not compute.'
#   end
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# FE
# ---

def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

# no block call
p compute(5) # 'Does not compute.'

# block call with 1 parameter
p compute(5) { |arg| arg} # 5

# block call with no parameter (no error raised)
p compute(5) { 10 } # 10

# no argument - error
p compute { nil } # ArgumentError

# Other Students:
def compute(arg, &block)
  block_given? ? block.call(arg) : 'Does not compute.'
end


p compute(10) { |n| n.abs2 } == 100
p compute(10, &:abs2) == 100
p compute('string', &:upcase) == 'STRING'
p compute([1, 2, 3], &:sum) == 6
p compute(5) { |n| puts n } == nil        # outputs 5
p compute(10) == 'Does not compute.'


def compute(arg="default", &block)
  block_given? ? block.call(arg) : "Does not compute."
end

chars = :chars.to_proc

p compute(&:upcase)               # => "DEFAULT" (implictly calls `to_proc` on the `Symbol` obj)
p compute(&chars) # What does the & mean???

def compute_with_args(*args)
  return 'Does not compute.' unless block_given?
  yield *args
end

p compute_with_args(100, 2, 40) { |n1, n2, n3| n1 + n2 * n3 } == 180