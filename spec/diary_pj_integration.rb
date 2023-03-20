require "diary_pj"
require "diary_entry_pj"

RSpec.describe "Diary Library Integration" do
  it "gets all diary entries" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("Title", "1 2 3 4 5")
    diary_entry_2 = DiaryEntry.new("Title2", "A B C D E")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    expect(diary.all).to eq [diary_entry_1, diary_entry_2]
  end

  it "returns count words from diary" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("Title", "1 2 3 4 5")
    diary_entry_2 = DiaryEntry.new("Title2", "A B C D E")
    diary_entry_3 = DiaryEntry.new("Title3", "F G H I J")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    diary.add(diary_entry_3)
    expect(diary.count_words).to eq 15
  end