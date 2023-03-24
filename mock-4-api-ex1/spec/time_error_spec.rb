require "time_error"

RSpec.describe TimeError do
  it "returns the time error" do
    time = Time.new(2023, 3, 24, 8, 55, 51)
    requester = double :requester
    expect(requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"GMT","client_ip":"2a02:6b65:9162:0:d946:9e2f:f6f6:ecfa","datetime":"2023-03-24T08:49:18.816511+00:00","day_of_week":5,"day_of_year":83,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1679647758,"utc_datetime":"2023-03-24T08:49:18.816511+00:00","utc_offset":"+00:00","week_number":12}')
    time_error = TimeError.new(requester, time)

    expect(time_error.error).to eq -392.183489
  end
end