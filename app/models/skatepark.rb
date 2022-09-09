class Skatepark < ActiveRecord::Base
    has_many :users

    def self.get_id_by_name name
        @park = self.find_by(name: name)
        @park.id
    end

end