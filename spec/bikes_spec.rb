require "bikes"

describe "Bikes" do 

	it "should not be broken" do 
		bikes = Bikes.new
		expect(bikes).not_to be_broken
	end

	it "should be able to break" do
		bikes = Bikes.new
		bikes.break
		expect(bikes).to be_broken
	end
end