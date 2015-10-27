class Client < ActiveRecord::Base
	belongs_to :user
	has_one :image

def self.search(query)
  where('first_name LIKE ? OR last_name LIKE ? OR address LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")
end

scope :search_id, -> (query) {
  return Client.where(national_id: query)
}

end
