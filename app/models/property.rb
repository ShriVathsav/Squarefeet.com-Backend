class Property < ApplicationRecord
    belongs_to :profile
    has_many :amenities, dependent: :delete_all
    has_many :furnishings, dependent: :delete_all
    has_many :other_rooms, dependent: :delete_all
    has_many :photos, dependent: :delete_all
end
