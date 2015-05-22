class Disagree < ActiveRecord::Base
	validates_presence_of :user

	belongs_to :user
	belongs_to :opinion
	belongs_to :comment
end
