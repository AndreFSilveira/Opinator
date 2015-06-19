class User < ActiveRecord::Base
    validates_presence_of :name
    validates_presence_of :uid
    validates_uniqueness_of :uid

    has_many :opinion, dependent: :destroy
    has_many :disagree, dependent: :destroy
    has_many :comment, dependent: :destroy
    def self.search(search)
    if search
        where(['lower(name) LIKE ?', "%#{search}%".downcase])
    else
        all
    end
  end
end
