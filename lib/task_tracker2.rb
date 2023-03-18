class TodoList
  # def initialize
    
  # end

  def add(todo)
    "'#{todo.capitalize}' has been added to your todo list."
  end

  def view_list
    fail "No todo given." 
  end
  
end