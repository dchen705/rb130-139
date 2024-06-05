# Write a method called map that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return a new Array that contains the return values produced by the block for each element of the original Array.

# If the Array is empty, map should return an empty Array, regardless of how the block is defined.

# Your method may use #each, #each_with_object, #each_with_index, #reduce, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.


# implicit block in definition

def map(array)
  array.each_with_object([]) do |element, new_array|
    new_array << yield(element)
  end
end
# explicit block (proc) in definition

def map(array, &block)
  array.each_with_object([]) do |element, new_array|
    new_array << block.call(element)
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# FE: does work with hashes and sets? - hm, we want to return an array of transformed values..
# the hash parameters need to be set?

p map({1 => 'a', 2 => 'b', 3 => 'c'}) { |key, value| key.to_s + value} # expect: ['1a', '2b', '3c']

# yield() is passing 2 value pair argument
# as long as block is set up with parameters accounting for this, it's fine.
# ANS: YES