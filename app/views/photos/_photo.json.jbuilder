json.extract! photo, :id, :image_data, :portfolio_id, :description, :created_at, :updated_at
json.url photo_url(photo, format: :json)
