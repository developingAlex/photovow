module ReviewsHelper
    # Rounds to nearest 0.5
    def round_stars(average)
      (average * 2).round / 2.0  
    end
  
    # Formats stars from: https://github.com/piratechicken/bookreviews/blob/master/app
    
    def format_stars(rating)

      average_stars = rating
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
