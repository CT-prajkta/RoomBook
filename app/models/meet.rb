class Meet < ActiveRecord::Base
    include Mongoid::Document
    belongs_to :user
    belongs_to :room
    field :meet_date_time, type: DateTime, default: ->{ Date.today }
    field :meet_to_datetime, type: DateTime, default: ->{ Date.today }
    field :subject, type: String
    #field :meet_datetime, type: Date, default: Date.today
    field :description, type: String
    field :room_no_id, type: Integer
    field :username_id, type: Integer
    field :created_at, type: DateTime, default: ->{ Date.today } 
    field :updated_at, type: DateTime, default: ->{ Date.today } 
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    validates :subject, presence: true, length: {minimum: 3, maximum: 50}
end