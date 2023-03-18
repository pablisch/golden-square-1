class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    todo = todo.capitalize
    fail "That todo is already on your list. Nothing was added." if @todo_list.include?(todo)
    @todo_list << todo
    "'#{todo}' has been added to your todo list."
  end

  def view_list
    fail "There are no todos on your list." if @todo_list.empty?
    @todo_list.each { |item| puts "* #{item}" }
  end

  def mark_completed(completed_todo)
    "There are no todos on your list."
  end
end

list = TodoList.new

list.add("take a break")
# list.add("take a break")
# list.add("get some sleep")
list.view_list