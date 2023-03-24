class Track
  def initialize(title, artist) 
    @title = title
    @artist = artist
  end

  def matches?(keyword) 
    "#{@artist} #{@title}".include?(keyword)
  end
end