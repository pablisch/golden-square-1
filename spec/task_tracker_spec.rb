require "task_tracker"

RSpec.describe "track_tasks method" do
  context "empty string passed as arg" do
    it "fails" do
      expect { track_tasks("") }.to raise_error "No text given."
    end
  end

  context "text contains #TODO" do
    it "returns true" do
      expect(track_tasks("#TODO")).to eq true
    end
  end
end