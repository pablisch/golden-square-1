require "diary_entry"
require "diary"

RSpec.describe DiaryEntry do
  context ">> Diary #entries" do
    it "returns a list of all diary entries #1" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title_13", "body_13")
      diary.add(entry_1)
      expect(diary.entries).to eq [entry_1]
    end

    it "returns a list of all diary entries #2" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title_1", "body_1")
      entry_2 = DiaryEntry.new("title_2", "body_2")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.entries).to eq [entry_1, entry_2]
    end
  end

  context ">> Diary #count_words" do
    it "returns a word count for all diary entries #1" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title_13", "one two three")
      diary.add(entry_1)
      expect(diary.count_words).to eq 3
    end

    it "returns a word count for all diary entries #2" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("title_1", "one two three")
      entry_2 = DiaryEntry.new("title_2", "four fove six seven")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 7
    end
  end

  
end