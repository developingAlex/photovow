require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :owner => nil,
      :title => "MyString",
      :venue => "MyString",
      :city => "MyString",
      :country => "MyString",
      :content => "MyText",
      :accepted_offer => 1
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

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
