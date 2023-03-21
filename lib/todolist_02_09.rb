require_relative "./diary_entry_02_09.rb"
require_relative "./diary_02_09.rb"

class TodoList
  # def initialize
  #   @list = []
  # end

  def view(diary) # an instance of Diary
    @list = diary.view_todos
    @list.each { |entry| puts "* #{entry.body.capitalize}" }
    no_todos
  end

  private

  def no_todos
    fail "There are no todos to view." if @list.empty?
  end
end

# diary = Diary.new
# list = TodoList.new
# # p list.view(diary)