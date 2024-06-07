# , fill in the missing part of the following code so we can convert an array of integers to base 8 (octal numbers). Use the comments for help in determining where to make your modifications, and make sure to review the "Approach/Algorithm" section for this exercise; it should prove useful.

# Replace the two `method_name` placeholders with actual method calls
def convert_to_base_8(n)
  n.to_s(8).to_i
end

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# Expected: [10, 12, 14, 16, 20, 41]

# in reverse order
# 3) convert proc to block
# 2) convert method to proc
# 1) define method

# getting stuck on how to convert to base 8
# oh the clue tells to look at Integer#to_s, I see, the first argument specifies which base to convert to...

# well that was easier, was thiking need to write algo myself

# I think this should work too
def convert_to_base_8(n)
  n.to_s(8).to_i
end

p [8, 10, 12, 14, 16, 33].map(&:convert_to_base_8)
# 6-method_to_proc.rb:29:in `map': private method `convert_to_base_8' called for 8:Integer (NoMethodError)
#         from 6-method_to_proc.rb:29:in `<main>'

# Why did that above error occur?
seems like there is difference between calling a method we define on the top scope environment vs
calling it on an instance/object

The purpose of using Object#method ie:
base8_proc = method(:convert_to_base_8).to_proc

it seems is to turn a method into an object that we can then pass convert to proc and pass around and be
used on instances