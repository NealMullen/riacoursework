class Post < ActiveRecord::Base
	belongs_to  :category
	belongs_to  :posttype
	
	#validates_presence_of :title, :description, :price, :category_id

	def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    scoped
	  end
	end
end
