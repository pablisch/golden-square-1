require "diary_entry_02_09"

RSpec.describe Entry do
  describe "#initialize, #title and #body" do
    it "fails if title is a blank string" do
      expect { Entry.new("", "Hello") }.to raise_error "No title entered."
    end

    it "fails if body is a blank string" do
      expect { Entry.new("Monday", "") }.to raise_error "No body entered."
    end

    it "returns an entry's title and body" do
      entry = Entry.new("Monday", "Hello")
      expect(entry.title).to eq "Monday"
      expect(entry.body).to eq "Hello"
    end
  end

  describe "#word_count" do
    it "returns word count of an entry's body" do
      entry = Entry.new("Monday", "Hello")
      expect(entry.count_words).to eq 1
    end

    it "returns word count of an entry's body" do
      entry = Entry.new("Monday", ("one two three four five " * 20))
      expect(entry.count_words).to eq 100
    end
  end

  describe "#reading_time" do
    it "fails when wpm <= 0" do
      entry = Entry.new("Monday", "Hello")
      expect { entry.reading_time(0) }.to raise_error "wpm must be a positive number."
    end

    it "returns estimated reading time when under 1 minute's worth of word" do
      entry = Entry.new("Monday", "Hello")
      expect(entry.reading_time(3)).to eq 1
    end

    it "returns estimated reading time when exactly 1 minute's worth of words" do
      entry = Entry.new("Monday", ("one two three four five " * 20))
      expect(entry.reading_time(100)).to eq 1
    end

    it "returns estimated reading time when just under 20 minute's worth of word" do
      entry = Entry.new("Monday", ("one two three four five " * 75)) # (375)
      expect(entry.reading_time(19)).to eq 20
    end

    it "returns estimated reading time when between 2 and 3 minute's worth of word" do
      entry_5 = Entry.new("Friday", "one two three four five six seven eight nine ten eleven") # (11)
      expect(entry_5.reading_time(5)).to eq 3
    end
  end
end