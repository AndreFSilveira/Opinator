class Opinion < ActiveRecord::Base
	validates_presence_of :description, :user_id
	validates :description, length: { minimum: 10 }

	belongs_to :user
end
