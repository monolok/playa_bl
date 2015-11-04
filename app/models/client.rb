class Client < ActiveRecord::Base
	belongs_to :user
	has_one :document
	accepts_nested_attributes_for :document, allow_destroy: true
  
  	validates :name, presence: true
  	validates :danger, presence: true

def self.search(query)
	where('name ILIKE ? OR address ILIKE ? OR country ILIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")
end

scope :search_id, -> (query) {
  return Client.where(national_id: query)
}

end