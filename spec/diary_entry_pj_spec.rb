require "diary_entry_pj"

  describe DiaryEntry do
    context "If no title is provided" do
      it "when No title is provided" do
      expect {DiaryEntry.new("", "I need some more sleep ")}.to raise_error "No title."
      end
    end  
  
    context "If no contents is provided" do
      it "when No contents is provided" do
      expect {DiaryEntry.new("Monday", "")}.to raise_error "No contents."
      end
    end 

    context "Return an entered title or contents" do
      it "return title" do
        entry = DiaryEntry.new("Monday", "Some contents")
        expect(entry.title).to eq "Monday"
      end

      it "return title" do
        entry = DiaryEntry.new("Tuesday", "Some contents")
        expect(entry.title).to eq "Tuesday"
      end

      it "return content" do
        entry = DiaryEntry.new("Tuesday", "Some contents")
        expect(entry.contents).to eq "Some contents"
      end
    end 

    context "#count_words" do
      it "returns number of words as integer" do
        entry = DiaryEntry.new("Monday", "Some contents")
        expect(entry.count_words).to eq 2
      end

      it "returns number of words as integer" do
        entry = DiaryEntry.new("Monday", "Some contents are here")
        expect(entry.count_words).to eq 4
      end
    end

    context "#reading_time" do
      it "returns an estimate of the reading time" do
        entry = DiaryEntry.new("Monday", "Some contents")
        expect(entry.reading_time(2)).to eq 1
      end

      it "returns an estimate of the reading time" do
        entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten ") * 10)
        expect(entry.reading_time(10)).to eq 10
      end
      
    end

    context "#reading_chunk" do
      it "Returns string chunk when called once" do
        entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten ") * 2)
        expect(entry.reading_chunk(5, 1)).to eq "one two three four five"
      end

      it "Returns string chunk when called more than once" do
        entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten ") * 2)
        entry.reading_chunk(4, 2)
        expect(entry.reading_chunk(4, 2)).to eq "nine ten one two three four five six"
      end

      it "Returns string part-chunk when called more than once" do
        entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten ") * 3)
        entry.reading_chunk(6, 2)
        entry.reading_chunk(6, 2)
        expect(entry.reading_chunk(6, 2)).to eq "five six seven eight nine ten"
      end

      it "Returns string from restarted contents when all has been read" do
        entry = DiaryEntry.new("Monday", ("one two three four five six seven eight nine ten ") * 2)
        entry.reading_chunk(6, 2)
        entry.reading_chunk(6, 2)
        expect(entry.reading_chunk(6, 2)).to eq "one two three four five six seven eight nine ten one two"
      end
    end
  end

