require "gratitudes"

RSpec.describe Gratitudes do
  context "initial state" do
    it "returns intro but no examples" do
      thankful = Gratitudes.new
      expect(thankful.format).to eq "Be grateful for: "
    end
  end

  context "a single example added" do
    it "returns intro with a single example" do
      thankful = Gratitudes.new
      thankful.add("my cohort")
      expect(thankful.format).to eq "Be grateful for: my cohort"
    end
  end

  context "multiple examples added" do
    it "returns intro with a multiple examples" do
      thankful = Gratitudes.new
      thankful.add("my cohort")
      thankful.add("my health")
      thankful.add("tea")
      expect(thankful.format).to eq "Be grateful for: my cohort, my health, tea"
    end
  end
end