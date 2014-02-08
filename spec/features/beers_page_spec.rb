require "spec_helper"

describe "Beers page" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:user) { FactoryGirl.create :user }
  
  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "can create beer with valid name" do
    visit new_beer_path
    select("Lager", from:"beer[style]")
    fill_in("beer[name]", with:"anonymous")
    
    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)
  end
  
  it "returns browser to create a beer page on failure" do
    visit new_beer_path
    select("Lager", from:"beer[style]")
    fill_in("beer[name]", with:"")
    
    expect {
      click_button "Create Beer"
    }.to_not change{Beer.count}.from(0).to(1)
    expect(page).to have_content "Name can't be blank"
  end
end
