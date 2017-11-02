require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :author => nil,
      :portfolio => nil,
      :content => "MyText",
      :rating => "9.99"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input[name=?]", "review[author_id]"

      assert_select "input[name=?]", "review[portfolio_id]"

      assert_select "textarea[name=?]", "review[content]"

      assert_select "input[name=?]", "review[rating]"
    end
  end
end
