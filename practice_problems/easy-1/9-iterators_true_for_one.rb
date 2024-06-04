# Enumerable#one? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for exactly one element, then #one? returns true. Otherwise, #one? returns false. Note in particular that #one? will stop searching the collection the second time the block returns true.

# Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns true a second time.

def one?(enum)
  enum.count { |ele| yield(ele) } == 1
end

# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false

# Ans Key:
# oops can't use count
#  conceivably use Array#count, but count looks at all of the elements; this violates our requirement that the method should stop processing as soon as it finds a second matching element.

def one?(enum)
  count = 0
  enum.each do |ele|
    count += 1 if yield(ele)
    return false if count > 1
  end
  !count.zero? # or count != 0 or count == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false

# similar structure, slight logic variation

def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end