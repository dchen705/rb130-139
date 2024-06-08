Transaction#prompt_for_payment has a call to Kernel#puts and that output is showing up when we run our test. Your task for this exercise is to make it so that we have "clean" output when running this test. We want to see something like this:

Run options: --seed 4957

# Running:

.

Finished in 0.000919s, 1087.9984 runs/s, 1087.9984 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

# my intiution is that like there's a stdin, maybe there's a stdout that if changed will make so output
isn''t shown on the test results.