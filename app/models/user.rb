class User < ActiveRecord::Base
  include RatingAverage
  has_secure_password
  has_many :ratings, :dependent => :destroy
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, through: :memberships
  
  validates :username, uniqueness: true, length: { minimum: 3,
                                                   maximum: 15
                                                 }
  validates :password, format: { with: /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,}/,
                                 message: "must have at least one number, one uppercase letter and be longer than 4 characters"
                               }
  
  # regexlibistä
  # /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,}/ 
end
