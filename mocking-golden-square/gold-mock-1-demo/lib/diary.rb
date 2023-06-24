class Diary
  def initialize
    @diary = []
  end

  def add(entry) 
    @diary << entry
  end

  def entries
    fail "There are no diary entries to show." if @diary.empty?
    @diary
  end

  def count_words
    count = 0
    @diary.each { |entry| count += entry.count_words }
    count
  end
end

