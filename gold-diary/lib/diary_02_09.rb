class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def entry_list
    @entries
  end

  def read_diary
    no_posts
    @entries.select { |entry| entry.title.downcase != "todo" }.each { |entry| puts entry.title; puts entry.body; puts }
  end

  def find_entry_to_read(wpm, minutes)
    no_posts
    possible_entries = @entries.select { |entry| (entry.count_words / wpm.to_f) <= minutes }
    readme = possible_entries.max_by(&:count_words)
    puts readme.title; puts readme.body; puts 
  end
  
  private
  
  def no_posts
    fail "There are no posts to read yet." if @entries.empty?
  end
end