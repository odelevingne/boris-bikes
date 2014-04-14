require 'docking_station.rb'

describe DockingStation do
  	
	it "should accept a new bike" do
		bike = double :bike
		station = DockingStation.new(:capacity => 20)
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end 

	it "should release a bike" do
		bike = double :bike
		station = DockingStation.new(:capacity => 20)
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it "should know when it's full" do 
		bike = double :bike
		station = DockingStation.new(:capacity => 20)
		expect(station).not_to be_full
		20.times { station.dock(bike)}
		expect(station).to be_full
	end

end