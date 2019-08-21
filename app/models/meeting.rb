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
  def self.UpdateStatus(v1,v2,v3)
    Room.all.each do |room|
      if room.capacity.to_s > v3.to_s
        Meeting.all.each do |mt|
              if (mt.room_id == room._id) && (mt.start_time <= v2 && mt.end_time >= v1)
                yeild room
              end
          end
      end
    end
  end
end