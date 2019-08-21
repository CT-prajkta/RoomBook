class Meeting
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :req_seats, type: Integer
  field :start_time, type: DateTime
  field :end_time, type: DateTime
  field :created_at, type: DateTime, default: ->{ Date.today } 
  field :updated_at, type: DateTime, default: ->{ Date.today } 
  validates :name, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 100}
  belongs_to :user
  belongs_to :room
  #validates :start_time,presence: true
  #validate :end_time,presence: true
  #validate :date_validation
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
  def date_validation
    if :end_time < :start_time
      errors[:end_time] << "Error message"
      return false
    else
      return true
    end
  end
  # def self.StartEndTime(v1,v2)
  #   :start_time=[ [v1(1i), v1(2i), v1(3i)].join('-'), [v1(4i), v1(5i)].join(':') ] .join(' ')]
  #   :end_time = [ [v2(1i), v2(2i), v2(3i)].join('-'), [v2(4i), v2(5i)].join(':') ] .join(' ')]
  # end
end