class OfferController < ApplicationController
  before_action :set_offer, only: [:show, :apply, :submit_offer, :edit, :update, :destroy]
  before_action :set_listing, only: [:index, :accept_offer, :show, :apply, :submit_offer, :edit, :update, :destroy]
  before_action :authenticate_user! # when not signed in do not reveal anything about offers.

  def index
    @users_listing = Listing.where(owner: current_user)
    @offers = Offer.where(listing: @users_listing)
    # photographers portfolios, 
    @portfolio_ids = []
    @offers.each do |offer|
      #offer has a photographer id and portfolio has a user id.
      @portfolio_ids << Portfolio.find_by(user: offer.photographer).id
    end
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
    if @offer.update_all "amount" => offer_params[:amount]
      puts "params:"
      puts params
      puts "params[:id]:"
      puts params[:id]
      puts "offer params:"
      puts offer_params
      redirect_to @listing
    else
      form.html{ redirect_to apply_listing(@listing), notice: 'please enter a value greater than 0 for amount' }
    end


    puts "########################################"
    puts " "
    puts "             offer#update"
    puts " "
    puts "########################################"

  end

  def destroy
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_offer
    @offer = Offer.where(photographer: current_user, listing: @listing)
  end

  def offer_params
    params.require(:offer).permit(:amount, :listing_id, :id)
  end
end
