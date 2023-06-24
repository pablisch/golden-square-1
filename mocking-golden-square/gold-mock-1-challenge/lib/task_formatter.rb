class TaskFormatter
  def initialize(task)
    @task = task
  end

  def format
    done = @task.complete? ? "x" : " "
    "- [#{done}] #{@task.title}"
    # Returns the task formatted as a string.
    # If the task is not complete, the format is:
    # - [ ] Task title
    # If the task is complete, the format is:
    # - [x] Task title
  end
end