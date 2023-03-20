require "diary_entry"

RSpec.describe DiaryEntry do
  it "fails if passed an empty title" do
    expect { DiaryEntry.new("", "Help") }.to raise_error "You provided an empty title."
  end

  it "fails if passed an empty contents" do
    expect { DiaryEntry.new("Monday", "") }.to raise_error "You provided an empty contents."
  end

  it "fails if passed 0 or less as wpm" do
    entry = DiaryEntry.new("Monday", "Some text.")
    expect { entry.reading_time(0) }.to raise_error "wpm must be a positive number."
  end

  context "it initialises with a given title and returns it" do
    it "creates a diary entry and returns the title (Tuesday)" do
      entry = DiaryEntry.new("Tuesday", "Got confused by TDD")
      expect(entry.title).to eq "Tuesday"
    end
  
    it "creates a diary entry and returns the title (Wednesday)" do
      entry = DiaryEntry.new("Wednesday", "Got confused by everything")
      expect(entry.title).to eq "Wednesday"
    end
  end

  context "it initialises with a given contents and returns it" do
    it "creates a diary entry and returns the contents (everything)" do
      entry = DiaryEntry.new("Wednesday", "Got confused by everything")
      expect(entry.contents).to eq "Got confused by everything"
    end

    it "creates a diary entry and returns the contents (everything)" do
      entry = DiaryEntry.new("Monday", "Got confused by myself")
      expect(entry.contents).to eq "Got confused by myself"
    end
  end

  context "return title and contents" do
    it "returns title (Thurs) and contents (life)" do
      entry = DiaryEntry.new("Thursday", "Got confused by life")
      expect("#{entry.title}, #{entry.contents}").to eq "Thursday, Got confused by life"
    end

    it "returns title (Thurs) and contents (life)" do
      entry = DiaryEntry.new("Thursday", "Got confused by life")
      expect("#{entry.title}, #{entry.contents}").to eq "Thursday, Got confused by life"
    end
  end

  context "return word count of contents" do
    it "returns 1 for a single word contents" do
      entry = DiaryEntry.new("Thursday", "Hello")
      expect(entry.count_words).to eq 1
    end

    it "returns 2 for a two word contents" do
      entry = DiaryEntry.new("Tuesday", "Bye bye")
      expect(entry.count_words).to eq 2
    end

    it "returns 200 for a two hundred word contents" do
      entry = DiaryEntry.new("Tuesday", ("word " * 200))
      expect(entry.count_words).to eq 200
    end
  end

  context "return word count of contents" do
    it "returns 1 for a single word contents" do
      entry = DiaryEntry.new("Thursday", "Hello")
      expect(entry.count_words).to eq 1
    end

    it "returns 2 for a two word contents" do
      entry = DiaryEntry.new("Tuesday", "Bye bye")
      expect(entry.count_words).to eq 2
    end

    it "returns 200 for a two hundred word contents" do
      entry = DiaryEntry.new("Tuesday", ("word " * 200))
      expect(entry.count_words).to eq 200
    end
  end

  context "return estimated reading time" do
    it "returns 1 for under 1 word and 200 wpm" do
      entry = DiaryEntry.new("Thursday", "Hello")
      expect(entry.reading_time(200)).to eq 1
    end

    it "returns 3 for 300 words and 100 wpm" do
      entry = DiaryEntry.new("Thursday", ("word " * 300))
      expect(entry.reading_time(100)).to eq 3
    end

    it "returns 10 for 2000 words and 200 wpm" do
      entry = DiaryEntry.new("Thursday", ("word " * 2000))
      expect(entry.reading_time(200)).to eq 10
    end
  end

  context "return text based on wpm and available time for the first call" do
    it "returns text where wpm = 10 and min = 1" do
      entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix " * 50))
      expect(entry.reading_chunk(10, 1)).to eq "one two three four five six seven eight nine ten"
    end

    it "returns text where wpm = 5 and min = 4" do
      entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix " * 50))
      expect(entry.reading_chunk(5, 4)).to eq "one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix"
    end

    it "returns text where wpm = 3 and min = 8 but the contents is shorter" do
      entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix " * 1))
      expect(entry.reading_chunk(3, 8)).to eq "one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix"
    end
  end

  context "return text based on wpm and available time after all content is read once over" do
    it "returns text where wpm = 15 and min = 1" do
      entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix " * 1))
      entry.reading_chunk(15, 1)
      entry.reading_chunk(15, 1)
      expect(entry.reading_chunk(15, 1)).to eq "one two three four five six seven eight nine ten un deux trois quatre cinq"
    end

    it "returns text on third chunk where wpm = 6 and min = 1" do
      entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix " * 1))
      entry.reading_chunk(6, 1)
      entry.reading_chunk(6, 1)
      entry.reading_chunk(6, 1)
      entry.reading_chunk(6, 1)
      expect(entry.reading_chunk(6, 1)).to eq "one two three four five six"
    end

    it "returns text on third chunk where wpm = 9 and min = 1" do
      entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten un deux trois quatre cinq six sept huit neuf dix " * 1))
      entry.reading_chunk(9, 1)
      entry.reading_chunk(9, 1)
      entry.reading_chunk(9, 1)
      expect(entry.reading_chunk(9, 1)).to eq "one two three four five six seven eight nine"
    end
  end

end