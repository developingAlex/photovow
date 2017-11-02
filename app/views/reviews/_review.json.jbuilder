json.extract! review, :id, :author_id, :portfolio_id, :content, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)
