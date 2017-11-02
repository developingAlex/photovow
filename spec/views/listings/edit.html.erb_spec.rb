require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :owner => nil,
      :title => "MyString",
      :venue => "MyString",
      :city => "MyString",
      :country => "MyString",
      :content => "MyText",
      :accepted_offer => 1
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[owner_id]"

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[venue]"

      assert_select "input[name=?]", "listing[city]"

      assert_select "input[name=?]", "listing[country]"

      assert_select "textarea[name=?]", "listing[content]"

      assert_select "input[name=?]", "listing[accepted_offer]"
    end
  end
end
