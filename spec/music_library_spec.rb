require "music_library"

RSpec.describe MusicLibrary do
  xit "" do
    library = MusicLibrary.new
    expect(library.all).to eq []
  end
end