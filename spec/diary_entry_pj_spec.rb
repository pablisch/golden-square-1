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
  end

