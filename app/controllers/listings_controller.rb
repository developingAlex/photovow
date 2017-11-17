class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :apply, :submit_offer, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :apply, :destroy, :update]
  before_action :prevent_offers_to_themselves, only:[:apply]

  # root
  def landing
  end

  # GET /listings
  # GET /listings.json
  def index
    if params[:search]
      @query = params[:search]
      @listings = Listing.search(@query)
      render '_search'
    else
      @listings = Listing.all
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    if user_signed_in?
      possible_offers = Offer.where(photographer: current_user, listing: @listing)
      if possible_offers.empty?
        @offer = Offer.new
        puts 'User signed in but not yet made an offer on this listing'
        @user_already_applied = false
      else
        @offer = possible_offers.first
        puts 'User signed in and offer set to previous offer'
        @user_already_applied = true
      end
    else
      @offer = nil
      puts 'User was not signed in so offer set to nil'
      @user_already_applied = false
    end

    puts @offer.inspect
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # GET 'listings/1/apply'
  def apply
    #if the current user already has an offer on this listing then make the button say revise offer, instead of apply.
    if current_user == @listing.owner
      redirect_to @listing
    end
    past_offer = Offer.where(photographer: current_user, listing: @listing)
    if past_offer.empty?
      @user_already_applied = false
      @offer = Offer.new
    else
      @offer = past_offer.first
      @previous_offer = past_offer.first
      @user_already_applied = true
    end
  end

  def accept_offer
    # run when the listing owner accepts a particular offer

    # t.integer "accepted_offer"
    # t.date "date_accepted"
    @listing = Listing.find(params[:id])
    if current_user == @listing.owner
      puts 'offer accepted! '
      @listing.accepted_offer = params[:offer_id]
      @listing.date_accepted = Date.today
      @listing.save
      redirect_to listing_offer_index_path(@listing)
    end
    

  end

  # POST /listings/1/apply
  def submit_offer
    #create a new offer model if the person has not already made an offer, if they have then bring up their old one and change the value.
    puts "####### begin dirty debug #######"
    past_offer = Offer.where(photographer: current_user, listing: @listing)
    if past_offer.empty?
      Offer.create!(photographer: current_user, amount: offer_params[:amount], listing: @listing)
      puts "created an offer with photographer of #{current_user.first_name}, amount of #{offer_params[:amount]}, against listing: #{@listing.title}"
    else
      @previous_offer = past_offer.first
      @previous_offer.amount = offer_params[:amount]
      if @previous_offer.valid?
        @previous_offer.save
      end
    end
    puts "####### end dirty debug #######"
  end

  def revise_offer
    past_offer = Offer.where(photographer: current_user, listing: @listing)
    @offer = past_offer.first
    if !@offer.nil? && offer_params[:amount] > 0
      @offer.amount = offer_params[:amount]
    else
      puts "########################################"
      puts " "
      puts "         listings#revise_offer"
      puts " "
      puts "########################################"
    end
  end
  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:owner_id, :title, :venue, :city, :country, :content, :date, :accepted_offer, :date_accepted)
    end

    def offer_params
      params.require(:offer).permit(:id, :amount)
    end

    def prevent_offers_to_themselves
      

      if current_user == @listing.owner
        flash[:error] = "you can't apply to your own listing"
        
        redirect_to @listing
      end
    end
end
