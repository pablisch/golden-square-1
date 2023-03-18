require "music_tracker"

RSpec.describe MusicTracker do
  it "fails returning 'No track name given.'" do 
    tracker = MusicTracker.new
    expect { tracker.add("") }.to raise_error "No track name given."
  end

  it "fails when list is empty" do 
    tracker = MusicTracker.new
    expect { tracker.list }.to raise_error "There are no tracks to list."
  end

  it "returns a single track having passed in a single track" do 
    tracker = MusicTracker.new
    tracker.add("Tell Her")
    expect { tracker.list }.to output("* Tell Her\n").to_stdout
  end

  it "returns a single track having passed in a single track" do 
    tracker = MusicTracker.new
    tracker.add("Baby Night")
    expect { tracker.list }.to output("* Baby Night\n").to_stdout
  end

  it "returns a single track having passed in a single track" do 
    tracker = MusicTracker.new
    tracker.add("Tell Her")
    tracker.add("Baby Night")
    tracker.add("Mother Sky")
    tracker.add("Birth of Creation")
    expect { tracker.list }.to output("* Tell Her\n* Baby Night\n* Mother Sky\n* Birth of Creation\n").to_stdout
  end

end