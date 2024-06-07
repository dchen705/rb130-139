items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*foods , wheat|
  puts "#{foods.join(', ')}"
  puts wheat
end

gather(items) do | apple, *foods, wheat|
  puts apple
  puts "#{foods.join(', ')}"
  puts wheat
end

gather(items) do | apple, *foods |
  puts apple
  puts "#{foods.join(', ')}"
end

gather(items) do | apple, corn, cabbage, wheat|
  puts "#{[apple, corn, cabbage, wheat].join(', ')}"
end