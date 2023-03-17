class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    fail "You provided an empty title." if title == ""
    fail "You provided an empty contents." if contents == ""
    @title = title
    @contents = contents
    @chunk = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split.length
  end

  def reading_time(wpm) 
  fail "wpm must be a positive number." if wpm == 0
  (@contents.split.length / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) 
    contents_array = @contents.split
    number_of_words = wpm * minutes
    @chunk = 0 if contents_array.length <= @chunk * number_of_words
    @chunk.times { contents_array.shift(number_of_words) }
    @chunk += 1
    contents_array.shift(number_of_words).join(" ")
  end
end

# entry = DiaryEntry.new("Tuesday", ("one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix " * 1))
# # p entry.contents
# p entry.reading_chunk(8, 1)
# puts
# p entry.reading_chunk(8, 1)
# puts
# p entry.reading_chunk(8, 1)
# puts
# p entry.reading_chunk(8, 1)
# puts