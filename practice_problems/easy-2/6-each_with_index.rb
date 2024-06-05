def each_with_index(collection)
  index = 0
  while index < collection.size
    yield(collection[index], index)
    index += 1
  end
  collection
end

#each_with_object - think object parameter is assigned to same object and we reassign during block won't work...

def each_with_index(collection)
  collection.each_with_object(0) do |element, index|
    yield(element, index)
    index += 1
  end
end
#... should fail

# reduce will work though

def each_with_index(collection)
  collection.reduce(0) do |index, element|
    yield(element, index)
    index += 1
  end
  collection
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# ANS KEY

def each_with_index(array)
  index = 0
  array.each do |item|
    yield(item, index)
    index += 1
  end
end

# weird way, iterate through indices instead

def each_with_index(array)
  (0...array.size).reduce(array) { |arr, idx| yield(arr[idx], idx); arr}
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]