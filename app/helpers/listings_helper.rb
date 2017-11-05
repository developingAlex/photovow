module ListingsHelper

def user_already_offered(user_object, listing_object)
  if !user_object.nil? && !listing_object.nil?
    possible_offers = Offer.where(photographer: user_object, listing: listing_object)
   !possible_offers.empty?
  end
end

end
