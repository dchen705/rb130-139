# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# def missing(sorted_arr)
#   all_nums_in_range = (sorted_arr[0]..sorted_arr[-1]).to_a
#   all_nums_in_range.reject do |num|
#     sorted_arr.include?(num)
#   end
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# Course Solution
# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

# FE
# Can you find other ways to solve this problem? What methods might prove useful? Can you find a way to solve this without using a method that requires a block?

# without a block?
# perhaps using a arg that converts to a proc throug symbol?

# using a manual loop? WORKS
# def missing(arr)
#   missing_nums = []
#   current_num = arr[0]
#   until current_num == arr[-1]
#     missing_nums << current_num unless arr.include?(current_num)
#     current_num += 1
#   end
#   missing_nums
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# using Array#- to get the difference between range and original arr WORKS

def missing(arr)
  full_sequence = (arr.first..arr.last).to_a
  full_sequence - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []