require 'spec_helper'

describe Beer do
  it "is not saved without a name" do
    beer = Beer.create style:"Lager"
    
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
  
  it "is saved with a valid name and style" do
    beer = FactoryGirl.create(:beer)
    
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end
  
  it "is not saved without a style" do
    beer = Beer.create name:"Karhu"
    
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
end 
