require "spec_helper"
include OwnTestHelper

describe "Beer club page" do
  let!(:beerclub) { BeerClub.create name:"anon", founded:1999 }
  let!(:user) { FactoryGirl.create :user }
  
  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end
  
  it "can be joined" do
    visit new_membership_path
    select("anon", from:"membership[beer_club_id]")
    
    expect{
      click_button "Create Membership"
    }.to change{user.beer_clubs.count}.from(0).to(1)
  end
end
