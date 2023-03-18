class MusicTracker
  def initialize
    @track_list = []
  end

  def add(track)
    fail "No track name given." if track.empty?
    @track_list << track
  end

  def list
    fail "There are no tracks to list." if @track_list.empty?
    @track_list.each { |song| puts "* #{song}" }
  end
end

tracker = MusicTracker.new
tracker.add("Tell Her")
tracker.add("Baby Night")
tracker.add("Mother Sky")
tracker.add("Birth of Creation")
tracker.list