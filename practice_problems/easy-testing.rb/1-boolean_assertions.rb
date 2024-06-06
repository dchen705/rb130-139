Write a minitest assertion that will fail if the value.odd? is not true.
I don''t understand the question:
gonna ask ChatGPT

Are we assuming `value` is an integer?
We are testing an assertion of expected return of #odd?

What component is an assertion again

I don''t have mental model to understand this...

assert_equals(true, value.odd?)
#or
assert(value.odd?)

^ Below to me is an assertion

An assertion is an expression that determines whether or not some piece of code returns an expected value

# Ans key:
assert value.odd?, 'value is not odd'
# they included a message

# I realize question `value` is integer is irrelative. We are assuming value is an object that
# responds to the #odd? call

# Most (but not all) of the minitest assertions let you specify a failure message as the final argument. This is frequently omitted since the error messages provided by default are usually sufficient. However, the default message for assert lacks context, so it is common to specify the failure message when using assert.
