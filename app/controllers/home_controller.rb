class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # determine if the user has a wedding listing
    @has_wedding_listing = true
    listings_for_user = Listing.where(owner: current_user)
    if listings_for_user.empty?
      @has_wedding_listing = false
    else
      @wedding_listing = listings_for_user.first
    end
    # determine if the user has a photographers profile already
    @no_portfolio_yet = false
    portfolios_for_user = Portfolio.where(user: current_user)
    if portfolios_for_user.empty?
      @no_portfolio_yet = true
    else
      @portfolio = portfolios_for_user.first
    end

  end

end
