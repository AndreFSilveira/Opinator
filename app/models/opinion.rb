class Opinion < ActiveRecord::Base
	validates_presence_of :description, :user_id, :title
  validates :description, length: { minimum: 10 }
  validates_inclusion_of :approved, :in => [true, false]
	validates :title, length: { minimum: 5 }

	belongs_to :user
  has_many :disagree
	has_many :agree
	# has_many :comment
end
