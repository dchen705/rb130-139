# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

def divisors(num)
  divisors = []
  midpoint = (num / 2) + 1
  1.upto(midpoint) do |increment|
    if num % increment == 0
      divisors << increment << (num / increment)
    end
  end
  divisors.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


# def divisors(number)
#   1.upto(number).select do |candidate|
#     number % candidate == 0
#   end
# end

# Further Exploration

p divisors(999962000357) == [1, 999979, 999983, 999962000357]
# my initial solution is too slow for this...
