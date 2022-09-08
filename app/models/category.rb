class Category < ActiveRecord::Base
    has_many :users

    def self.get_id_by_name name
        @category = self.find_by(name: name.downcase)
        @category.id
    end

end