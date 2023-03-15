def estimated_time(words)
  words = words.delete("-")
  words_array = words.split(/[\/\s\.]/)
  words_array.reject { |word| word == "" }.length / 200.0
end