class User < ApplicationRecord
    has_many :reviews
    validates :name, presence: true, length: { minimum: 6 }
    validates :password, presence: true, length: { minimum: 6 }
end

