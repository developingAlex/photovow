require 'rails_helper'

RSpec.describe "portfolios/show", type: :view do
  before(:each) do
    @portfolio = assign(:portfolio, Portfolio.create!(
      :bio => "MyText",
      :user => nil,
      :avatar_data => "MyText",
      :city => "City",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Country/)
  end
end
