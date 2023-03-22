require "task_tracker"

RSpec.describe "track_tasks method" do
  context "empty string passed as arg" do
    it "fails" do
      expect { track_tasks("") }.to raise_error "No text given."
    end
  end
end

RSpec.shared_examples "text arg" do |text, bool|
  it "returns #{bool} when passed #{text}" do
    expect(track_tasks(text)).to eq bool
  end
end

describe "track_tasks method" do
  include_examples "text arg", "#TODO", true
  include_examples "text arg", "Hello #TODO Goodbye!", true
  include_examples "text arg", "#TODO#TODO", true
  include_examples "text arg", "#TODOOBIE", true
  include_examples "text arg", "#TO DO", false
  include_examples "text arg", "#TOD", false
  include_examples "text arg", "ODOT#", false
end
