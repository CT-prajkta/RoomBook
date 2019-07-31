class Meet < ApplicationRecord
    include Mongoid::Document
    field :time_from, type: Time
    field :time_to, type: Time
    field :time_to, type: Date, Default :Now
    field :description, type: String
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    field :room_no, belongs_to: room
end
