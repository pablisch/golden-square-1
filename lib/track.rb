class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

  def matches?(keyword) 
    "#{@title} #{@artist}".downcase.include?(keyword.downcase)
  end
end