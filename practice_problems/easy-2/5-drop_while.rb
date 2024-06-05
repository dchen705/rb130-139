# Write a method called drop_while that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return all the elements of the Array, except those elements at the beginning of the Array that produce a truthy value when passed to the block.

# If the Array is empty, or if the block returns a truthy value for every element, drop_while should return an empty Array.

# Your method may use #each, #each_with_object, #each_with_index, #reduce, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

# hmm feel like I can use recursion here:

# base case: when iterative block returns true

# example recursion: original array into smaller and smaller subarrays
# [1, 3, 5, 6] -> [3, 5, 6] -> [5, 6] -> ...

# yield statement will take the first element of each subarray

def drop_while(array)
  yield(array[0]) ? drop_while(array[1..-1]) : array
end

# ^ this gave error: 5-drop_while.rb:17:in `drop_while': no block given (yield) (LocalJumpError)

def drop_while(array, &block) # need to save block as an explicit closure object to pass into subsequent recursive calls
  return array if array.empty? # need to account for empty array
  block.call(array[0]) ? drop_while(array[1..-1], &block) : array # can substitute block call with yield statement too
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

# Without recursion, using iteration

def drop_while(array)
  while yield(array[0])
    return array if array.empty?
    array = array[1..-1]
  end
  array
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

# ANS KEY: Iterating by index and returning the appropriate slice
def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end

  array[index..-1]
end


# Other student
# def drop_while(arr)
#   arr.size.times do |idx|
#     return arr[idx..] unless yield(arr[idx])
#   end
#   []
# end

# def drop_while(arr)
#   arr.each_with_index { |el, idx| return arr[idx..-1] unless yield(el) }
#   []
# end

# this one's weird:

def drop_while(arr)
  arr[(arr.inject(0) { |m, e| yield(e) ? m + 1 : (break m)})..-1]
end

# a variation:

def drop_while(arr)
  arr[arr.reduce(0) { |i, x| yield(x) ? i + 1 : (break(i)) }..]
end


# okay basically, it boils down to arr[x..] where x is that long confusing statement which is
# meant to return the index at which the block yields false - honestly same mechanism as all the other
# solutions, just diff syntax


My intial thought was using recursion because:
1) Can visualize method as repeatedly executing over a smaller and smaller part
2) There's a simple explicit base case.

# Example Pathway:
#   [1, 3, 5, 6] -> [3, 5, 6] -> [5, 6] -> [6] -> []
#     - Recurse `drop_while` on incrementally smaller array slices

# Base Case:
# - when a recursively looped block call evaluates to false on first element of its array slice, return that array slice
  - otherwise keep recursing
  - (I initially forgot base case when array is empty - so actually there was 2 base cases...)

def drop_while(array, &block)
  return array if array.empty?
  block.call(array[0]) ? drop_while(array[1..-1], &block) : array
end

# Another strategy, like answer key's, was to iterate by index then return the appropriate slice.
# In retrospect, that was probably the less complicated solution. For instance:
# 1) don't need to explicitly account for empty array
# 2) don't need to save an explicit closure object

# Other student:
# def drop_while(arr)
#   result = arr.dup
#   result.shift while result.size > 0 && yield(result[0])
#   result
# end