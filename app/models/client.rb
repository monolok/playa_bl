class Client < ActiveRecord::Base
	belongs_to :user
	has_one :image

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("first_name like ?", "%#{query}%") 
  end

end


# def self.search(search)
#   if search
#     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
#   else
#     find(:all)
#   end
# end


# "first_name"
# "last_name"
# "national_id"
# "address"
# "image_id"
# "created_at"
# "updated_at"
# "user_id"