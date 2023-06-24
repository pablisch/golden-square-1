require "diary"

RSpec.describe Diary do
  context ">> Diary #entries" do
    it "returns a list of all diary entries" do
      diary = Diary.new
      entry_1 = double :entry
      entry_2 = double :entry
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.entries).to eq [entry_1, entry_2]
    end
  
    it "Diary #entries fails if there are no entries" do
      diary = Diary.new
      expect { diary.entries }.to raise_error "There are no diary entries to show."
    end
  end

  context ">> Diary #count_words" do
    it "returns a word count for all diary entries #1" do
      diary = Diary.new
      entry_1 = double :entry, count_words: 3
      diary.add(entry_1)
      expect(diary.count_words).to eq 3
    end
    
    it "returns a word count for all diary entries #2" do
      diary = Diary.new
      entry_1 = double :entry, count_words: 3
      entry_2 = double :entry, count_words: 4
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 7
    end
  end
end