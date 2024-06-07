# Suppose we want to organize our array contents into groups, where variables represent category names. Can we do that without extracting items directly from the array based on their indices?

# We can use the splat operator(*) to do something like this:

# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']

# Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block parameters in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.

birds = %w(raven finch hawk eagle)

def group_raptors(bird_list)
  yield(bird_list[2..])
end

group_raptors(birds) { |raptors| p raptors }

# don't think that's what they're going for...

def group_raptors(bird_list)
  yield(bird_list[2..])
end

# After ANS KEY
# Prompt: The method should yield the contents of the array to a block, which should assign your block parameters in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.

def bird_types(birds)
  yield(birds)
end

bird_types(birds) { |_, _, *raptors| p raptors }