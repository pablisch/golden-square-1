require "task_tracker2"

RSpec.describe TodoList do
  context "#add" do
    it "fails when todo item already exists" do
      list = TodoList.new
      list.add("take a break")
      expect { list.add("take a break") }.to raise_error "That todo is already on your list. Nothing was added."
    end

    it "return confirmation when an item is added" do
      list = TodoList.new
      expect(list.add("take a break")).to eq "'Take a break' has been added to your todo list."
    end

    it "return confirmation when an item is added" do
      list = TodoList.new
      expect(list.add("get more sleep")).to eq "'Get more sleep' has been added to your todo list."
    end
  end

  context "#view_list" do
    it "fails when there are no items to view" do
      list = TodoList.new
      expect { list.view_list }.to raise_error "There are no todos on your list."
    end

    it "return list with todo item/s" do
      list = TodoList.new
      list.add("take a break")
      expect { list.view_list }.to output("* Take a break\n").to_stdout
    end

    it "return list with todo item/s" do
      list = TodoList.new
      list.add("get some sleep")
      expect { list.view_list }.to output("* Get some sleep\n").to_stdout
    end

    it "return list with todo item/s" do
      list = TodoList.new
      list.add("get some sleep")
      list.add("take a break")
      expect { list.view_list }.to output("* Get some sleep\n* Take a break\n").to_stdout
    end
  end

  context "#mark_completed" do
    it "fail when trying to complete todo but list is empty" do
      list = TodoList.new
      expect { list.mark_completed("take a break") }.to raise_error "There are no todos on your list."
    end

    it "fail when trying to complete todo but passing an empty string" do
      list = TodoList.new
      list.add("get more sleep")
      expect { list.mark_completed("") }.to raise_error "No todo was entered as completed."
    end

    it "fail when trying to complete todo but there is no match" do
      list = TodoList.new
      list.add("get more sleep")
      expect { list.mark_completed("take a break") }.to raise_error "That task is not on your list of todos."
    end

    it "delete from list and output confirmation when completed_todo has match" do
      list = TodoList.new
      list.add("take a break")
      expect { list.mark_completed("take a break") }.to output("'Take a break' has been completed and removed from your list of todos.\n").to_stdout
    end

    it "delete from list and output confirmation when completed_todo has match" do
      list = TodoList.new
      list.add("get more sleep")
      expect { list.mark_completed("get more sleep") }.to output("'Get more sleep' has been completed and removed from your list of todos.\n").to_stdout
    end

    it "return list when items added, marked as complete and then list viewed" do
      list = TodoList.new
      list.add("take a break")
      list.add("get more sleep")
      list.add("go for a walk")
      list.mark_completed("go for a walk")
      expect { list.view_list }.to output("* Take a break\n* Get more sleep\n").to_stdout
    end
  end
end