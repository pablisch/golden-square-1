def estimate_time(words)
  words = words.delete("-")
  words_array = words.split(/[\/\s\.]/)
  time = words_array.reject { |word| word == "" }.length / 200.0
  time == 0.0 ? "There is nothing to read" : time < 1 ? "Under a minute" : 
  time < 2 ? "Around a minute" : "#{time.to_i} minutes"
end