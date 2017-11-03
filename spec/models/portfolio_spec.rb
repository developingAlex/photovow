require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "requires a bio text to be created" do
    tempuser1 = User.create!(first_name: "Andy", last_name: "Lindeman", password: "password", email: "temp1@mail.com")
    expect(Portfolio.create!(user: tempuser1, avatar_data: 'test', city: 'Canberra', country: 'Australia')).to eq(nil)
  end
end
