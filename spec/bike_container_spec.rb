require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  
  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }
    
  it "should accept a bike" do        
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)    
    expect(holder.bike_count).to eq(1)
  end

  it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it "should know when it's full" do 
    expect(holder).not_to be_full
    fill_station(holder)
    expect(holder).to be_full
  end

  it "should not accept a bike if it's full" do
    fill_station(holder)
    expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
  end


  def fill_station(holder)
    (holder.capacity).times{holder.dock(bike)}
  end

  it "should provide the list of available bikes" do
    working_bike = double :bike, broken?:false 
    broken_bike = double :bike, broken?:true
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq ([working_bike])
  end

end