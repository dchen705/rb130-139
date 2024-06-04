def count(array)
  array.reduce(0) { |count, value| yield(value) ? count += 1 : count}
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# OTHER STUDENTS
# top comment:
def count(collection)
  collection.reduce(0) { |count, element| yield(element) ? count + 1 : count }
end
# slightly more versatile naming choice though

# other option - simplest i think:
def count(collection, &block)
  collection.select(&block).size
end

# using recursion - alternative loop without iterators - most unique
def count(arr, &block)
  return 0 if arr.empty?
  yield(arr.shift) ? count(arr, &block) + 1 : count(arr, &block)
end

# another recursion
def count(array, &block)
  return 0 if array.length == 0
  remaining_count = count(array[1..-1], &block)
  yield(array[0]) ? remaining_count + 1 : remaining_count
end