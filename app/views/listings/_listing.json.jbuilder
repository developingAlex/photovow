json.extract! listing, :id, :owner_id, :title, :venue, :city, :country, :content, :date, :accepted_offer, :date_accepted, :created_at, :updated_at
json.url listing_url(listing, format: :json)
