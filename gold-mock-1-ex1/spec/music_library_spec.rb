require "music_library"
require "track"

RSpec.describe MusicLibrary do
  context ">> MusicLibrary #all" do
    it "fails when there are no tracks" do
      library = MusicLibrary.new
      expect { library.all }.to raise_error "There are no tracks to show."
    end

    it "returns a list of 1 track" do
      library = MusicLibrary.new
      track_1 = double :track
      library.add(track_1)
      expect(library.all).to eq [track_1]
    end

    it "returns a list of 2 tracks" do
      library = MusicLibrary.new
      track_1 = double :track
      track_2 = double :track
      library.add(track_1)
      library.add(track_2)
      expect(library.all).to eq [track_1, track_2]
    end
  end

  context ">> MusicLibrary #all" do
    it "fails when there are no tracks" do
      library = MusicLibrary.new
      expect { library.all }.to raise_error "There are no tracks to show."
    end

    it "returns a list of 1 track" do
      library = MusicLibrary.new
      track_1 = double :track, matches?: true
      library.add(track_1)
      expect(library.search("yowser")).to eq [track_1]
    end

    it "returns a list of 2 tracks" do
      library = MusicLibrary.new
      track_1 = double :track, matches?: true
      track_2 = double :track, matches?: false
      track_3 = double :track, matches?: true
      library.add(track_1)
      library.add(track_2)
      library.add(track_3)
      expect(library.search("yowser")).to eq [track_1, track_3]
    end
  end
end