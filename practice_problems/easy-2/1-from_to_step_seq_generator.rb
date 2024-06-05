def step(start_value, end_value, step_value)
  values = [start_value]
  loop do
    yield(values.last)
    values << values.last + step_value
    break yield(values.last) if values.last >= end_value
  end
  values
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# confused on where to put the break statement: Ans key demos

def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point
    current_value += increment
  end
  current_value
end

# easier to understand of what i did
def step (start, stop, step)
  value = start
  output_array = []

  while value <= stop
    output_array << value
    yield(value)
    value += step
  end

  output_array
end

p step(1, 10, 3) { |value| puts "value = #{value}" }