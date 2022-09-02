class User < ActiveRecord::Base
    belongs_to :skatepark
    belongs_to :category
end