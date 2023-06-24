class MusicLibrary
  def initialize
    @library = []
  end

  def add(track) 
    @library << track
  end

  def all
    fail "There are no tracks to show." if @library.empty?
    @library
  end
  
  def search(keyword) 
    @library.select { |track| track.matches?(keyword) }
  end
end
