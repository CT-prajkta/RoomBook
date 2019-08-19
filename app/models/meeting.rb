class Meeting
  include Mongoid::Document
  attr_accessor :start_time, :end_time
  field :name, type: String
  field :description, type: String
  field :req_seats, type: Integer
  field :start_time, type: DateTime
  field :end_time, type: DateTime
  field :created_at, type: DateTime, default: ->{ Date.today } 
  field :updated_at, type: DateTime, default: ->{ Date.today } 
  belongs_to :user
  belongs_to :room
end
