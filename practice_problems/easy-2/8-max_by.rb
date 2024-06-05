def max_by(array)
  return nil if array.empty?
  array[1..-1].reduce(array[0]) do |max, value|
    yield(value) > yield(max) ? value : max
  end
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil

# simple solution by others
def max_by(arr)
    max = nil
    arr.each { |val| max = val if max == nil || yield(val) > yield(max) }
    max
end

def max_by(arr)
  max = arr[0]

  arr.each do |num|
    max = num if yield(num) > yield(max)
  end

  max
end