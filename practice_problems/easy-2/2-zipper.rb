# Write your own version of zip that does the same type of operation. It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.

def zip(arr1, arr2)
  arr1.map.with_index { |_, idx| [arr1[idx], arr2[idx]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Other student:
# def zip(arr1, arr2)
#   (0...arr1.size).map { |i| [arr1[i], arr2[i]] }
# end