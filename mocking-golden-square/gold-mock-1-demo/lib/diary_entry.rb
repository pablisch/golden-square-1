class DiaryEntry
  def initialize(title, body) 
    @title = title
    @body = body
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
end