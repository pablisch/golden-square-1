require "task_tracker2"

RSpec.describe TodoList do
  context "#view_list" do
    it "fails when there are no items to view" do
      list = TodoList.new
      expect { list.view_list }.to raise_error "No todo given."
    end
  end
end