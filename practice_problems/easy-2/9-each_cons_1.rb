def each_cons(array)
  (1...array.size).each { |idx2| yield(array[idx2 - 1], array[idx2]) }
  nil
end

# One liner
def each_cons(array)
  (1...array.size).each { |idx2| yield(array[idx2 - 1], array[idx2]) } && nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil

# Ans key:
def each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
  nil
end

# Other student
def each_cons(arr)
  arr.inject { |memo, elem| yield(memo, elem); elem }
  nil
end

# using Array#[] of length 2
def each_cons(arr)
  index = 0

  while index <= arr.size - 2
    yield(arr[index, 2])
    index += 1
  end

  nil
end

# using #times
def each_cons(arr)
  (arr.size - 1).times { |idx| yield(arr[idx], arr[idx + 1]) }
  nil
end

# upto 0 to arr.size - 2
def each_cons(arr)
  0.upto(arr.size - 2) do |ele1|
    yield(arr[ele1, 2])
  end
  nil
end