require './lib/carnival'
require './lib/attendee'
require './lib/ride'

RSpec.describe Carnival do
  before(:each) do
    @jeffco_fair = Carnival.new("Jefferson County Fair")

    @ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    @bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    @scrambler = Ride.new({name: 'Scrambler', cost: 15})

    @bob = Attendee.new('Bob', 20)
    @sally = Attendee.new('Sally', 20)
    @johnny = Attendee.new("Johnny", 5)
  end

  it 'exists' do
    expect(@jeffco_fair.name).to eq("Jefferson County Fair")
  end

  it 'adds rides to the park' do
    expect(@jeffco_fair.rides).to eq([])

    @jeffco_fair.add_ride(@ferris_wheel)
    @jeffco_fair.add_ride(@bumper_cars)
    @jeffco_fair.add_ride(@scrambler)

    expect(@jeffco_fair.rides).to eq([@ferris_wheel, @bumper_cars, @scrambler])
  end

  it 'recommends rides based on interest' do
    @jeffco_fair.add_ride(@ferris_wheel)
    @jeffco_fair.add_ride(@bumper_cars)
    @jeffco_fair.add_ride(@scrambler)

    @bob.add_interest('Ferris Wheel')
    @bob.add_interest('Bumper Cars')
    @sally.add_interest('Scrambler')

    expect(@jeffco_fair.recommend_rides(@bob)).to eq([@ferris_wheel, @bumper_cars])
    expect(@jeffco_fair.recommend_rides(@sally)).to eq([@scrambler])
  end

  it 'test for attendees in the park' do
    @jeffco_fair.add_ride(@ferris_wheel)
    @jeffco_fair.add_ride(@bumper_cars)
    @jeffco_fair.add_ride(@scrambler)

    @bob.add_interest('Ferris Wheel')
    @bob.add_interest('Bumper Cars')
    @sally.add_interest('Bumper Cars')
    @johnny.add_interest('Bumper Cars')

   expect(@jeffco_fair.attendees).to eq([])

   @jeffco_fair.admit(@bob)
   @jeffco_fair.admit(@sally)
   @jeffco_fair.admit(@johnny)

   expect(@jeffco_fair.attendees).to eq([@bob, @sally, @johnny])
  end

  it 'seperates attendees by ride of interest' do
    @jeffco_fair.add_ride(@ferris_wheel)
    @jeffco_fair.add_ride(@bumper_cars)
    @jeffco_fair.add_ride(@scrambler)

    @bob.add_interest('Ferris Wheel')
    @bob.add_interest('Bumper Cars')
    @sally.add_interest('Bumper Cars')
    @johnny.add_interest('Bumper Cars')

    @jeffco_fair.admit(@bob)
    @jeffco_fair.admit(@sally)
    @jeffco_fair.admit(@johnny)

    expected = {@ferris_wheel => [@bob],
                @bumper_cars => [@bob, @sally, @johnny],
                @scrambler => []
               }

    expect(@jeffco_fair.attendees_by_ride_interest).to eq(expected)
  end
end
