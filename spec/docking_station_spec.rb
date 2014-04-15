require 'docking_station.rb'


describe DockingStation do
		
	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 20) }

	it "should accept a new bike" do
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end 

	it "should release a bike" do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq(0)
	end

	it "should know when it's full" do 
		expect(station).not_to be_full
		20.times { station.dock(bike)}
		expect(station).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_station(station)
		expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
	end


	def fill_station(station)
		20.times { station.dock(bike) }
	end

	it "should provide the list of available bikes" do
		working_bike = double :bike, broken?:false 
		broken_bike = double :bike, broken?:true
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq ([working_bike])
	end

end

