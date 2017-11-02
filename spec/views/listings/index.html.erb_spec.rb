require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :owner => nil,
        :title => "Title",
        :venue => "Venue",
        :city => "City",
        :country => "Country",
        :content => "MyText",
        :accepted_offer => 2
      ),
      Listing.create!(
        :owner => nil,
        :title => "Title",
        :venue => "Venue",
        :city => "City",
        :country => "Country",
        :content => "MyText",
        :accepted_offer => 2
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Venue".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
