require 'rails_helper'

RSpec.describe "portfolios/new", type: :view do
  before(:each) do
    assign(:portfolio, Portfolio.new(
      :bio => "MyText",
      :user => nil,
      :avatar_data => "MyText",
      :city => "MyString",
      :country => "MyString"
    ))
  end

  it "renders new portfolio form" do
    render

    assert_select "form[action=?][method=?]", portfolios_path, "post" do

      assert_select "textarea[name=?]", "portfolio[bio]"

      assert_select "input[name=?]", "portfolio[user_id]"

      assert_select "textarea[name=?]", "portfolio[avatar_data]"

      assert_select "input[name=?]", "portfolio[city]"

      assert_select "input[name=?]", "portfolio[country]"
    end
  end
end
