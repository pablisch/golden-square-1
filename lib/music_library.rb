class MusicLibrary
  def initialize
    @library = []
    # ...
  end

  def add(track) 
    @library << track
    # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
  end

  def all
    @library
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
    @library.select { |tracks| tracks.matches?(keyword) == true }
  end
end