require 'spec_helper'

describe "Places" do
  it "if one is returned by the API, it is shown on the page" do
    BeermappingApi.stub(:places_in).with("kumpula").and_return(
      [Place.new(:name => "Oljenkorsi")]
    )
    
    visit places_path
    fill_in("city", with: "kumpula")
    click_button "Search"
    
    expect(page).to have_content "Oljenkorsi"
  end
  
  it "if more than one are returned by the API, they are shown on the page" do
    BeermappingApi.stub(:places_in).with("kumpula").and_return(
      [Place.new(:name => "Oljenkorsi"), Place.new(:name => "stub"), Place.new(:name => "stub2")]
    )

    visit places_path
    fill_in("city", with: "kumpula")
    click_button "Search"
    
    expect(page).to have_content "Oljenkorsi"
    expect(page).to have_content "stub"
    expect(page).to have_content "stub2"
  end
  
  it "if no places are found, display notification" do
    BeermappingApi.stub(:places_in).with("kumpula").and_return([])
    
    visit places_path
    fill_in("city", with: "kumpula")
    click_button "Search"
    expect(page).to have_content "No locations in kumpula"
  end
end
