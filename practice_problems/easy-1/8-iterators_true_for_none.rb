def none?(enum)
  enum.select { |ele| yield(ele) }.empty?
end

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

# Discussion

# implement none? using !any?

# caveat: must make implicit block -> explicit (Proc conversion using & in parameters)

def any?(arr)
  # return false if arr.empty? -> unneccesary
  arr.each do |element|
    return true if yield(element)
  end
  false
end

def none?(enum, &block)
  !any?(enum, &block)
end

# why do i need to do any?(enum, &block)
# I get an argumenterror expecting 1 got 2 when I call any?(enum, block)
# even at point of method invocation - need to prepend & to specify to Ruby - this aint a normal
# argument, it's a proc

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true