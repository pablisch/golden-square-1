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
    completed_todo = completed_todo.capitalize
    # puts @todo_list
    fail "There are no todos on your list." if @todo_list.empty?
    fail "No todo was entered as completed." if completed_todo.empty?
    fail "That task is not on your list of todos." unless @todo_list.include?(completed_todo)
    puts "'#{completed_todo}' has been completed and removed from your list of todos."
    @todo_list.delete(completed_todo)
  end
end

list = TodoList.new

list.add("take a break")
# list.add("take a break")
# list.add("get some sleep")
# list.view_list
list.mark_completed("take a break")