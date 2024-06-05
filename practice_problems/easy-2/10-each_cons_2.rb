# interestingly blocks use the splat operator when greater than 2 values, well whatever,
# can we can also pass in a splat argument to yield?

# how do we handle dynamic number of arguments into yield - splat i think, nope
# feel like using array slice by length

# how do know when to stop iteration?
# arr.size / cons_length =
# 4 / 1 = 4
# 4 / 2 = 3
# 4 / 3 = 2
# 4 / 4 = 1
# okay actual relationship is:
# times iteration = arr.size - cons_length + 1

# anything more intuitive? starting index = (arr.size - 1) - cons_length
# from index 0 to index arr.size - 1 - cons_length
# in other words (0...(arr.size - cons_length))

def each_cons(arr, cons_length)
  (0..(arr.size - cons_length)).each { |start_idx| yield(*arr[start_idx, cons_length]) }
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash #== { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}