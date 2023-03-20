require "diary_pj"
require "diary_entry_pj"

RSpec.describe "Diary Integration" do
  describe "#all returns entered diary entries" do
    it "returns a single entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three four five")
      diary.add(entry_1)
      expect(diary.all).to eq [entry_1]
    end

    it "returns multiple entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three four five")
      entry_2 = DiaryEntry.new("Tuesday", "un deux trois quatre cinq")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq [entry_1, entry_2]
    end
  end

  describe "#count_words returns the number of words in all entries combined" do
    it "returns word count from a single entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three four five")
      diary.add(entry_1)
      expect(diary.count_words).to eq 5
    end

    it "returns word count from multiple entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three four five")
      entry_2 = DiaryEntry.new("Tuesday", "un deux trois quatre cinq six")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 11
    end

    it "returns word count from multiple entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", "one two three four five")
      entry_2 = DiaryEntry.new("Tuesday", "un deux trois quatre cinq six")
      entry_3 = DiaryEntry.new("Wednesday", "cat mouse dog bat deer tiger elephant")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.count_words).to eq 18
    end
  end

  describe "#reading_time returns the reading time for all entries combined" do
    it "returns reading time from a single entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", ("one two three four five ") * 10)
      diary.add(entry_1)
      expect(diary.reading_time(10)).to eq 5
    end

    it "returns reading time from multiple entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", ("one two three four five ") * 20)
      entry_2 = DiaryEntry.new("Tuesday", ("un deux trois quatre cinq six") * 10)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(10)).to eq 16
    end

    it "returns reading time from multiple entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", ("one two three four five ") * 100)
      entry_2 = DiaryEntry.new("Tuesday", ("un deux trois quatre cinq six ") * 20)
      entry_3 = DiaryEntry.new("Wednesday", ("cat mouse dog bat deer tiger elephant ") * 10)
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.reading_time(20)).to eq 35
    end
  end

  describe "#find_best_entry_for_reading_time returns appropriate entry" do
    it "returns entry within reading range from a single entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", ("one two three four five ") * 1)
      diary.add(entry_1)
      expect(diary.find_best_entry_for_reading_time(4, 1)).to eq entry_1
    end

    it "returns entry within reading range from multiple entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", ("one two three four five ") * 1) # => 5
      entry_2 = DiaryEntry.new("Tuesday", ("un deux trois quatre cinq six sept ") * 1) # => 7
      entry_3 = DiaryEntry.new("Wednesday", ("cat mouse dog bat deer tiger elephant donkey rabbit ") * 1) # => 9
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.find_best_entry_for_reading_time(5, 2)).to eq entry_3 # (10)
    end

    it "returns entry within reading range from multiple entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", ("one two three four five ") * 1) # => 5
      entry_2 = DiaryEntry.new("Tuesday", ("un deux trois quatre cinq six sept ") * 1) # => 7
      entry_3 = DiaryEntry.new("Wednesday", ("cat mouse dog bat deer tiger elephant donkey rabbit") * 1) # => 9
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.find_best_entry_for_reading_time(1, 8)).to eq entry_2 # (8)
    end

    it "returns entry within reading range from multiple entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Monday", ("one two three four five ") * 1) # => 5
      entry_2 = DiaryEntry.new("Tuesday", ("un deux trois quatre cinq six sept ") * 1) # => 7
      entry_3 = DiaryEntry.new("Tuesday", ("un deux trois quatre cinq six sept ") * 2) # => 14
      entry_4 = DiaryEntry.new("Tuesday", ("un deux trois quatre cinq six sept ") * 3) # => 21
      entry_5 = DiaryEntry.new("Wednesday", ("cat mouse dog bat deer tiger elephant donkey rabbit ") * 1) # => 9
      entry_6 = DiaryEntry.new("Wednesday", ("cat mouse dog bat deer tiger elephant donkey rabbit ") * 2) # => 18
      entry_7 = DiaryEntry.new("Wednesday", ("cat mouse dog bat deer tiger elephant donkey rabbit ") * 3) # => 27
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      diary.add(entry_5)
      diary.add(entry_6)
      diary.add(entry_7)
      expect(diary.find_best_entry_for_reading_time(1, 20)).to eq entry_6 # (18)
    end
  end
end

