require "diary_entry"

RSpec.describe DiaryEntry do
  it "fails if passed an empty title" do
    expect { DiaryEntry.new("", "Help") }.to raise_error "You provided an empty title."
  end

  it "fails if passed an empty contents" do
    expect { DiaryEntry.new("Monday", "") }.to raise_error "You provided an empty contents."
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
  end

end