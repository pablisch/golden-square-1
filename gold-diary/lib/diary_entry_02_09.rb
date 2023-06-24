class Entry
  def initialize(title, body)
    fail "No title entered." if title.empty?
    fail "No body entered." if body.empty?
    @title = title
    @body = body
    @done = false
  end

  def title
    @title
  end

  def body
    @body
  end

  def count_words
    @body.split.size
  end

  def reading_time(wpm)
    fail "wpm must be a positive number." if wpm <= 0
    (count_words / wpm.to_f).ceil
  end

  def done?
    @done
  end

  def completed!
    @done = true
  end
end