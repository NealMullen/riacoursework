class Post < ActiveRecord::Base
	belongs_to  :category 
	belongs_to  :posttype
	#validates_presence_of :title, :description, :price, :category_id

	def self.search(search)
	  if search
	   joins(:category).where('title LIKE ? OR categories.name LIKE ?', "%#{search}%","%#{search}%")
	  else
	    scoped
	  end
	end
end
