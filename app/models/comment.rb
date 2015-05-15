class Comment < ActiveRecord::Base
	validates_presence_of :description, :user_id, :opinion_id
    validates :description, length: { minimum: 10 }

    belongs_to :user
    belongs_to :opinion
    has_many :agree, dependent: :destroy
    has_many :disagree, dependent: :destroy

end