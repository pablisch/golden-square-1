require "music_library"
require "track"

RSpec.describe "music library project integration" do
  context ">> MusicLibrary #all" do
    it "returns a list of 1 track" do
      library = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_1")
      library.add(track_1)
      expect(library.all).to eq [track_1]
    end

    it "returns a list of 2 tracks" do
      library = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_1")
      track_2 = Track.new("title_2", "artist_2")
      library.add(track_1)
      library.add(track_2)
      expect(library.all).to eq [track_1, track_2]
    end
  end

  context ">> MusicLibrary #search" do
    it "returns a list of 1 track" do
      library = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_1")
      track_2 = Track.new("the title_2", "artist_2")
      library.add(track_1)
      library.add(track_2)
      expect(library.search("the")).to eq [track_2]
    end

    it "returns a list of 2 tracks" do
      library = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_113")
      track_2 = Track.new("title_21", "artist_2")
      track_3 = Track.new("title_213", "artist_2")
      library.add(track_1)
      library.add(track_2)
      library.add(track_3)
      expect(library.search("13")).to eq [track_1, track_3]
    end
  end
end