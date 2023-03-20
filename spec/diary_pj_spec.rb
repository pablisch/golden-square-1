require "diary_pj"

RSpec.describe Diary do
  context "#all" do
    it "returns an empty array when there are no entries" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end
end