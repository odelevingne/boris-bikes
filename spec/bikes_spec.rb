require "bikes"

describe "Bike" do 
	let(:bike) {Bike.new}
	it "should not be broken" do 
		expect(bike).not_to be_broken
	end

	it "should be able to break" do
		bike.break!
		expect(bike).to be_broken
	end

	it "should be able to fix if broken" do
		bike.break!.fix!
		expect(bike).not_to be_broken
	end
end






