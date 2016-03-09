require 'spec_helper'

describe "index page" do
  it "has Highest-Rated games" do
    visit('/')
    expect(page).to have_content("Highest-Rated")
  end

  it "has Recently Added games" do
    visit('/')
    expect(page).to have_content("Recently Added")
  end

  it "has Recently Added games" do
    visit('/')
    expect(page).to have_css('ul')
  end
end