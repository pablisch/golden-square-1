require_relative "./diary_entry_pj"

class Diary
  def initialize
    @entries = []
  end

  def add(entry) 
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    @entries.map { |entry| entry.count_words }.sum
  end

  def reading_time(wpm) 
    @entries.map { |entry| entry.reading_time(wpm) }.sum
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

# diary = Diary.new
# entry_1 = DiaryEntry.new("Monday", "one two three four five")
# diary.add(entry_1)
# entry_2 = DiaryEntry.new("Tuesday", "un deux trois quatre cinq six")
# diary.add(entry_2)
# # p diary.all
# p diary.count_words