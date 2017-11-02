require 'rails_helper'

RSpec.describe "portfolios/index", type: :view do
  before(:each) do
    assign(:portfolios, [
      Portfolio.create!(
        :bio => "MyText",
        :user => nil,
        :avatar_data => "MyText",
        :city => "City",
        :country => "Country"
      ),
      Portfolio.create!(
        :bio => "MyText",
        :user => nil,
        :avatar_data => "MyText",
        :city => "City",
        :country => "Country"
      )
    ])
  end

  it "renders a list of portfolios" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
