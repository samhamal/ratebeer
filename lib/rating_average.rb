module RatingAverage
  def average_rating
    "Has " + ratings.count.to_s + " rating".pluralize(ratings.count) + ", average " + ('%.1f' % ratings.average('score')).to_s
  end
  
  def average_rating_num
    ratings.average('score')
  end
end
