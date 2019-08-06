class Meet < ApplicationRecord
    include Mongoid::Document
    field :time_from, type: Time
    field :time_to, type: Time
    field :subject, type: String
    field :date, type: Date, default: Date.today
    field :description, type: String
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    validates :subject, presence: true, length: {minimum: 3, maximum: 50}
    belongs_to :user
end
#add_reference :meets, :username, foreign_key: true
#add_column :users, :password_digest, :string