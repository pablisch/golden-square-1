class DiaryEntry
  def initialize(title, contents)
    fail "No title." if title.empty?
    fail "No contents." if contents.empty?
    @title = title
    @contents = contents
    @to_read = @contents.split
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split.size
  end

  def reading_time(wpm)
    fail "wpm must be a positive number" if wpm <= 0
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) 
    chunk = @to_read.shift(wpm * minutes)
    @to_read = @contents.split if @to_read.empty?
    chunk.join(" ")
  end
end