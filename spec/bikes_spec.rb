require "bikes"

describe "Bikes" do 
	let(:bikes) {Bikes.new}
	it "should not be broken" do 
		expect(bikes).not_to be_broken
	end

	it "should be able to break" do
		bikes.break!
		expect(bikes).to be_broken
	end

	it "should be able to fix if broken" do
		bikes.break!.fix!
		expect(bikes).not_to be_broken
	end
end