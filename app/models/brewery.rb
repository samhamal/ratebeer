class Brewery < ActiveRecord::Base
  include RatingAverage
  has_many :beers, :dependent => :destroy
  has_many :ratings, :through => :beers
  
  validates :name, presence: true
  validates :year, presence: true, numericality: 
                                 { greater_than_or_equal_to: 1024,
                                   less_than_or_equal_to: Proc.new { Time.now.year },
                                   only_integer: true
                                 }
  
  def print_report
    puts name
    puts "establised at year #{year}"
    puts "number of beers #{beers.count}"
    puts "number of ratings #{ratings.count}"
  end
  
  def restart
    self.year = 2014
    puts "changed year to #{year}"
  end
end
