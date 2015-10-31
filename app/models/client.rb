class Client < ActiveRecord::Base
	belongs_to :user
	has_one :document
	accepts_nested_attributes_for :document, allow_destroy: true


def self.search(query)
  where('name LIKE ? OR address LIKE ? OR country LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")
end

scope :search_id, -> (query) {
  return Client.where(national_id: query)
}

end
