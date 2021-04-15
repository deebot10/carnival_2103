require './lib/ride'
require './lib/attendee'

RSpec.describe Attendee do
  it 'exists' do
    attendee = Attendee.new('Bob', 20)

    expect(attendee.name).to eq("Bob")
    expect(attendee.spending_money).to eq(20)
  end

  it 'adds interest to rides' do
    attendee = Attendee.new('Bob', 20)

    expect(attendee.interests).to eq([])

    attendee.add_interest("Bumper Cars")
    attendee.add_interest("Ferris Wheel")

    expect(attendee.interests).to eq(["Bumper Cars", "Ferris Wheel"])
  end
end
