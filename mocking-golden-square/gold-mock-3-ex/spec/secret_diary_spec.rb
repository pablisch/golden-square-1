require "secret_diary"

RSpec.describe SecretDiary do
  describe "Reading diary entries" do
    it "raises an error, go away when trying to read a new secret diary" do
      diary = double :diary
      secret = SecretDiary.new(diary)
      expect { secret.read }.to raise_error "Go Away!"
    end

    it "returns contents if diary is unlocked" do
      diary = double :diary, read: "Goodbye"
      secret = SecretDiary.new(diary)
      secret.unlock
      expect(secret.read).to eq "Goodbye"
    end

    it "raises an error, go away when diary has been locked" do
      diary = double :diary
      secret = SecretDiary.new(diary)
      secret.unlock
      secret.lock
      expect { secret.read }.to raise_error "Go Away!"
    end
  end
end