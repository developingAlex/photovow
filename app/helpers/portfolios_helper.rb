module PortfoliosHelper
  # Rounds to nearest 0.5
  def round_stars(average)
    (average * 2).round / 2.0  
  end

  # Formats stars from: https://github.com/piratechicken/bookreviews/blob/master/app
  
  def format_stars(portfolio)
    average_stars = portfolio.reviews.average(:rating)
    rounded_stars = round_stars(average_stars)
    stars_arr = []

    rounded_stars.floor.times do |index| 
      stars_arr << "star 2x"
    end 

    if rounded_stars > rounded_stars.floor 
      stars_arr << "star-half-o 2x"
      (4 - average_stars.floor).times do |index| 
        stars_arr << "star-o 2x"
      end 
    else 
      (5 - rounded_stars.floor).times do |index| 
        stars_arr << "star-o 2x"
      end 
    end
    
    stars_arr
  end

end
