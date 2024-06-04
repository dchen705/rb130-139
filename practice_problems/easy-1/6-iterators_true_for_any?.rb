# Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for any of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns true.

# If the Array is empty, any? should return false, regardless of how the block is defined.

def any?(arr)
  # return false if arr.empty? -> unneccesary
  arr.each do |element|
    return true if yield(element)
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# FE
# Does your solution work with other collections like Hashes or Sets?
require 'set'
puts "FE\n---"
p any?(Set[1, 3, 5, 6]) { |value| value.even? } == true

# i imagine works for hashes too, as long aw we use blocks with appropriate parameters

# other student - clever one liner
def any?(arr)
  arr.each_with_object(false) { |n| return true if yield(n) }
end