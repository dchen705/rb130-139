# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end

def gather(items)
  yield(items.join(', ')) if block_given?
end

gather(items) do |gathered_items|
  puts "Let's start gathering food."
  puts gathered_items
  puts "Nice selection of food we have gathered!"
end

# Ans key and top comment explanation:
