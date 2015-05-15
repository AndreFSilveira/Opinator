class User < ActiveRecord::Base
    validates_presence_of :name
    validates_presence_of :email
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
    validates_presence_of :password
    validates :password, length: { minimum: 6 }
    validates_uniqueness_of :email

    has_many :opinion, dependent: :destroy
end
