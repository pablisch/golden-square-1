class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    fail "No title." if title.empty?
    fail "No contents." if contents.empty?
    @title = title
    @contents = contents
    @to_read = @contents.split
  end

  def title

    return @title
    # Returns the title as a string
  end

  def contents
    @contents
    # Returns the contents as a string
  end

  def count_words
    @contents.split.size
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm)
    (count_words / wpm.to_f).ceil
    # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) 
    chunk = @to_read.shift(wpm * minutes)
    @to_read = @contents.split if @to_read.empty?
    chunk.join(" ")
  end
end