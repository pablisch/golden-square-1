require "music_library"
require "track"

RSpec.describe "music integration test" do
  context "Returning track where tracks have been added" do
    it "Returns two tracks in a list" do
      library = MusicLibrary.new
      track_1 = Track.new("Fred Williams", "Tell Her")
      track_2 = Track.new("Sons of Kemet", "Creation")
      library.add(track_1)
      library.add(track_2)
      expect(library.all).to eq [track_1, track_2]
    end

    xit "Returns two tracks in a list" do
      library = MusicLibrary.new
      track_1 = Track.new("Ted Williams", "Tell Her")
      track_2 = Track.new("Sons of Kemet", "The Comet")
      library.add(track_1)
      library.add(track_2)
      expect(library.all).to eq [track_1, track_2]
    end
  end
end