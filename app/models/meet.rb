#require 'spec_helper'
class Meet < ActiveRecord::Base
    include Mongoid::Document
    belongs_to :user
    #has_one :room
    field :req_seats, type: Integer
    field :room_id, type: Integer
    field :meet_date_time, type: DateTime#, default: ->{ Date.today }
    field :meet_to_datetime, type: DateTime# default: ->{ Date.today }
    field :subject, type: String
    field :description, type: String
    field :created_at, type: DateTime, default: ->{ Date.today } 
    field :updated_at, type: DateTime, default: ->{ Date.today } 
    validates :description, presence: true, length: {minimum: 5, maximum: 100}
    validates :subject, length: {minimum: 3, maximum: 50}
    validates :user_id, presence: true
    validates :room_id, presence: true
    #scope: RoomAvailableOnDuraion ,  ->{where(Meet.) }
    #query.created = {$gte: :meet_to_datetime, $lt: :meet_date_time};
    #db.meets.find({$and:[{$or:[{meet_to_datetime: {$gte: this.@meet.meet_to_datetime}},{meet_date_time: {$lt: this.@meet.meet_date_time}}] }]
    #meet_to_datetime: {$gte: this.@meet.meet_to_datetime},
    #meet_date_time: {$lt: this.@meet.meet_date_time}
    #room_no_id
    #})
    #Room.find_by( { price: { $not: { $gt: 1.99 } } } )
    #Room.find({_id:{$nin:[ ]}})
    #Band.where(name: "Photek").!exists?
end