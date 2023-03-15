require "manage_time"

RSpec.describe "manage_time method" do
  it "returns 0 if string is empty" do
    result = estimated_time("")
    expect(result).to eq 0.0
  end

  context "under 1 minute reading" do
    it "returns an estimated time for two words" do
      expect(estimated_time("Hello world")).to eq 0.01
    end

    it "returns an estimated time for one scentence" do
      expect(estimated_time("Follow the design recipe to implement the following user stories in your project. User stories follow a specific format don't worry about that too much now, you'll get the hang of it.")).to eq 0.16
    end

    it "returns an estimated time for one scentence with hyphen" do
      expect(estimated_time("Follow the design recipe to implement the following user stories in your project. User stories follow a - specific format don't worry about that too much now, you'll get the hang of it.")).to eq 0.16
    end

    it "returns an estimated time for one scentence with hyphen, elipses and forward slash" do
      expect(estimated_time("and/or and-or... mother-in-law  ... - ")).to eq 0.02
    end

  end

  context "Over 1 minute of reading" do
    it "returns an estimated time for long text" do
      expect(estimated_time("Follow the design recipe to implement the following user stories in your project. User stories follow a specific format don't worry about that too much now, you'll get the hang of it. We and our partners store and or access information on a device, such as cookies and process personal data, such as unique identifiers and standard information sent by a device for personalised ads and content, ad and content measurement, and audience insights, as well as to develop and improve products. With your permission we and our partners may use precise geolocation data and identification through device scanning. You may click to consent to our and our partners' processing as described above. Alternatively you may click to refuse to consent or access more detailed information and change your preferences before consenting. Please note that some processing of your personal data may not require your consent, but you have a right to object to such processing. Your preferences will apply to this website only. You can change your preferences at any time by returning to this site or visit our privacy policy. We and our partners store and or access information on a device, such as cookies and process personal data, such as unique identifiers and standard information sent by a device for personalised ads and content, ad and content measurement, and audience insights, as well as to develop and improve products. With your permission we and our partners may use precise geolocation data and identification through device scanning. You may click to consent to our and our partners' processing as described above. Alternatively you may click to refuse to consent or access more detailed information and change your preferences before consenting. Please note that some processing of your personal data may not require your consent, but you have a right to object to such processing. Your preferences will apply to this website only. You can change your preferences at any time by returning to this site or visit our privacy policy.")).to eq 1.66
    end
  end

end