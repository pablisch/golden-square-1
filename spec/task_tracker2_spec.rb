require "task_tracker2"

RSpec.describe TodoList do
  context "#add" do
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
      expect { list.view_list }.to raise_error "No todo given."
    end

    it "return list with todo item/s" do
      list = TodoList.new
      list.add("take a break")
      expect(list.view_list).to eq "* Take a break"
    end
  end
end