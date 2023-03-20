require "present"

RSpec.describe Present do
  context "content is passed for wrapping and unwrapping" do
    it "wraps and unwraps contents" do
      present = Present.new
      present.wrap("painting")
      expect(present.unwrap).to eq "painting"
    end
  end

  context "unwrap before wrapping" do
    it "fails" do
      present = Present.new
      expect { present.unwrap }.to raise_error "No contents have been wrapped."
    end
  end

  context "contents has already been wrapped" do
    it "fails" do
      present = Present.new
      present.wrap("toy")
      expect { present.wrap("book") }.to raise_error "A contents has already been wrapped."
    end
  end
end