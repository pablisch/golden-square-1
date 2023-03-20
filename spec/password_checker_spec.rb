require "password_checker"

RSpec.describe PasswordChecker do
  context "Password is >= 8 chars" do
    it "returns true" do
      expect(PasswordChecker.new.check("12345678")).to eq true
    end

    it "returns true" do
      expect(PasswordChecker.new.check("12fgHY%1@@9)")).to eq true
    end
  end

  context "Password is < 8 chars" do
    it "returns true" do
      expect { PasswordChecker.new.check("1234567") }.to raise_error "Invalid password, must be 8+ characters."
    end

    it "returns true" do
      expect { PasswordChecker.new.check("") }.to raise_error "Invalid password, must be 8+ characters."
    end
  end
end