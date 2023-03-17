class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @contents_array = contents.split # only needed for Matt and Maddy's code
    @array_of_words = @contents.split
    @counter = 0 # only needed for Matt and Maddy's code
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    @contents.split.length
  end

  def reading_time(wpm) 
    @contents.split.length / wpm
  end

  # Matt and Maddy's code
  # def reading_chunk(wpm, minutes)
  #   string_to_return = @contents_array[@counter...@counter+(wpm * minutes)].join(" ")
  #   if @counter + (wpm * minutes) >= @contents_array.length
  #     @counter = 0
  #   else
  #     @counter += (wpm * minutes)
  #   end
  #   return string_to_return
  # end

  # Code based on working with Arya
  def reading_chunk(wpm, minutes) 
    chunk = @array_of_words.shift(wpm * minutes)
    @array_of_words = @contents.split if @array_of_words.empty?
    chunk.join(" ") 
  end
    
    # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
end

diary_entry = DiaryEntry.new('title',"one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix ")
p diary_entry.reading_chunk(9,1)
p diary_entry.reading_chunk(9,1)
p diary_entry.reading_chunk(9,1)
p diary_entry.reading_chunk(9,1)