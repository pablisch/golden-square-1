class TodoList

  def view(diary) # an instance of Diary
    @list = diary.entry_list.select { |entry| entry.title.downcase == "todo" && entry.done? == false }
    @list.each { |entry| puts "* #{entry.body.capitalize}" }
    no_todos
  end

  private

  def no_todos
    fail "There are no todos to view." if @list.empty?
  end
end
