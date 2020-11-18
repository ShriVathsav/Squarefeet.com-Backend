class Profile < ApplicationRecord
    has_many :properties, dependent: :delete_all
    validates :email, uniqueness: true
    has_secure_password
end
