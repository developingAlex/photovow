module PortfoliosHelper
  # Rounds to nearest 0.5 (portfolio helper)
  def round_stars(average)
    (average * 2).round / 2.0  
  end

  # Formats stars from: https://github.com/piratechicken/bookreviews/blob/master/app
  def average_stars_score(portfolio)
    if !portfolio.reviews.average(:rating).nil?
      portfolio.reviews.average(:rating)
    else
      0
    end

  end

  def score_as_percentage(portfolio)
    '%.2f' % (average_stars_score(portfolio) / 5.0 * 100)
  end

  def format_stars_portfolio_average(portfolio)
    average_stars = average_stars_score(portfolio)
    rounded_stars = round_stars(average_stars)
    stars_arr = []

    rounded_stars.floor.times do |index| 
      stars_arr << "star 1x"
    end 

    if rounded_stars > rounded_stars.floor 
      stars_arr << "star-half-o 1x"
      (4 - average_stars.floor).times do |index| 
        stars_arr << "star-o 1x"
      end 
    else 
      (5 - rounded_stars.floor).times do |index| 
        stars_arr << "star-o 1x"
      end 
    end
    
    stars_arr
  end

end
