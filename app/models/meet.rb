class Meet < ApplicationRecord
    include Mongoid::Document
    field :time_from, type: Time
    field :time_to, type: Time
    field :date, type: Date, default: Date.today
    field :description, type: String
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    belongs_to :user
end
