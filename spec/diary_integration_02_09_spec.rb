require "diary_entry_02_09"
require "diary_02_09"
require "contacts_02_09"
require "todolist_02_09"

RSpec.describe "Diary, Entry, TodoList & Contacts integration" do
  context "View entries that have been instantiated" do
    it "outputs entries when called by #read_diary" do
      diary = Diary.new
      entry_1 = Entry.new("Monday", "Hello")
      diary.add(entry_1)
      expect { diary.read_diary }.to output("Monday\nHello\n\n").to_stdout
    end

    it "outputs entries when called by #read_diary where TODOs are inlcuded" do
      diary = Diary.new
      entry_1 = Entry.new("Monday", "Hello")
      entry_2 = Entry.new("Tuesday", "How are you?")
      entry_3 = Entry.new("Wednesday", "Please let me sleep!")
      entry_4 = Entry.new("todo", "mess this up")
      entry_5 = Entry.new("TODO", "mess this up")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      diary.add(entry_5)
      expect { diary.read_diary }.to output("Monday\nHello\n\nTuesday\nHow are you?\n\nWednesday\nPlease let me sleep!\n\n").to_stdout
    end
  end

  context "View longest entry that can be read in time available at given wpm" do
    it "outputs entry that best matches wpm and minutes avaiable" do
      diary = Diary.new
      entry_1 = Entry.new("Monday", "Hello")
      diary.add(entry_1)
      expect { diary.find_entry_to_read(1, 1) }.to output("Monday\nHello\n\n").to_stdout
    end

    it "outputs entries when called by #read_diary" do
      diary = Diary.new
      entry_1 = Entry.new("Monday", "Hello")
      entry_2 = Entry.new("Tuesday", "How are you?")
      entry_3 = Entry.new("Wednesday", "Please let me sleep!")
      entry_4 = Entry.new("Thursday", "one two three four five six seven eight")
      entry_5 = Entry.new("Friday", "one two three four five six seven eight nine ten eleven")
      entry_6 = Entry.new("Friday", ("one two three four five six seven eight nine ten " * 10))
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      diary.add(entry_5)
      diary.add(entry_6)
      expect { diary.find_entry_to_read(1, 1) }.to output("Monday\nHello\n\n").to_stdout
      expect { diary.find_entry_to_read(1, 3) }.to output("Tuesday\nHow are you?\n\n").to_stdout
      expect { diary.find_entry_to_read(1, 4) }.to output("Wednesday\nPlease let me sleep!\n\n").to_stdout
      expect { diary.find_entry_to_read(5, 2) }.to output("Thursday\none two three four five six seven eight\n\n").to_stdout
      expect { diary.find_entry_to_read(4, 4) }.to output("Friday\none two three four five six seven eight nine ten eleven\n\n").to_stdout
      expect { diary.find_entry_to_read(25, 4) }.to output("Friday\n#{("one two three four five six seven eight nine ten ") * 10}\n\n").to_stdout
    end
  end

  context "View todos when one or more has been entered - 1 of 1" do
    it "outputs todos on list" do
      diary = Diary.new
      list = TodoList.new
      entry_1 = Entry.new("todo", "sleep")
      diary.add(entry_1)
      expect { list.view(diary) }.to output("* Sleep\n").to_stdout
    end
    
    it "View todos when one or more has been entered - 3 of 6" do
      diary = Diary.new
      list = TodoList.new
      entry_1 = Entry.new("Monday", "Hello")
      entry_2 = Entry.new("todo", "eat")
      entry_3 = Entry.new("Todo", "sleep")
      entry_4 = Entry.new("Thursday", "one two three four five six seven eight")
      entry_5 = Entry.new("TODO", "pray")
      entry_6 = Entry.new("Friday", ("one two three four five six seven eight nine ten " * 10))
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      diary.add(entry_5)
      diary.add(entry_6)
      expect { list.view(diary) }.to output("* Eat\n* Sleep\n* Pray\n").to_stdout
    end   

    it "View todos when one or more has been entered including completed - 2 of 6" do
      diary = Diary.new
      list = TodoList.new
      entry_1 = Entry.new("Monday", "Hello")
      entry_2 = Entry.new("todo", "eat")
      entry_3 = Entry.new("Todo", "sleep")
      entry_4 = Entry.new("Thursday", "one two three four five six seven eight")
      entry_5 = Entry.new("TODO", "pray")
      entry_6 = Entry.new("Friday", ("one two three four five six seven eight nine ten " * 10))
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      diary.add(entry_5)
      diary.add(entry_6)
      entry_2.completed!
      expect { list.view(diary) }.to output("* Sleep\n* Pray\n").to_stdout
    end 

    it "when all todos have been completed" do
      diary = Diary.new
      list = TodoList.new
      entry_1 = Entry.new("todo", "sleep")
      diary.add(entry_1)
      entry_1.completed!
      expect { list.view(diary) }.to raise_error "There are no todos to view."
    end
  end
end
