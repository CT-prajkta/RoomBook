class Room
    include Mongoid::Document
    field :room_no, type: Number
    field :capacity, type: Number
    validates :room_no, presence: true, uniqueness:true, length: {minimum: 1, maximum: 3}
end
  