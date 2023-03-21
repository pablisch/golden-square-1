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
    # returns the sum of a new array with the DiaryEntry #count_words called on each DiaryEntry object
    # @entries.sum(&:count_words)
  end

  def reading_time(wpm) 
    @entries.map { |entry| entry.reading_time(wpm) }.sum
    # returns the sum of a new array with the DiaryEntry #reading_time called on each DiaryEntry object
    # @entries.sum(&:reading_time(wpm))
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    @entries.select { |entry| entry.reading_time(wpm) <= wpm * minutes }.sort_by { |entry| entry.count_words }[-1]
    # selects only DiaryEntry objects which have a reading time <= the amount of words able to be read in the time available
    # the new array is sorted by the DiaryEntry #count_words, low to high
    # the last entry, the one with the highest word count, is returned
  end
end
