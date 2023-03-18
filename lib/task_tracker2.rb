class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    @todo_list << todo.capitalize
    "'#{todo.capitalize}' has been added to your todo list."
  end

  def view_list
    fail "There are no todos on your list." if @todo_list.empty?
    @todo_list.map { |item| puts "* #{item}" }
  end
end

list = TodoList.new

list.add("take a break")
list.add("get some sleep")
list.view_list