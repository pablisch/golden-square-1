## Describe the problem

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

- Method needs to count the number of words
- Divide that number by 200 to claculate the estimated reading time in minutes

## Design the Method Signature

`reading_time = estimate_reading_time(text)`

text: a string, the text that needs to be read
reading_time = a float, the estimated number of minutes to read

## Create Examples as Tests

estimate_reading_time(text_of_200_words) => 1.0
estimate_reading_time(text_of_100_words) => 0.5
estimate_reading_time(text_of_1000_words) => 5
estimate_reading_time(text_of_0_words) => 0
estimate_reading_time(text_of_1_words) => 0.005
estimate_reading_time(text_of_10_words) => 0.05






