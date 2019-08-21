class Event
  include Mongoid::Document
  field :title, type: String
  field :held_on, type: Date
  field :start_time, type: Time
  field :starts_at, type: Time
  field :ends_at, type: Time
end
