require 'reminder_error'

RSpec.describe Reminder do
  context "when no task is set" do
    it "fails" do
      reminder = Reminder.new("Kay")
      # expect(reminder.remind()).to eq "No reminder set!"
      expect { reminder.remind() }.to raise_error "No reminder set!"
    end
  end
end