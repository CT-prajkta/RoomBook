namespace :room do
  rooms = [{room_no: 1,capacity: 1000},
    {room_no: 2,capacity: 300},
    {room_no: 3,capacity: 40},
    {room_no: 4,capacity: 200},
    {room_no: 5,capacity: 100},
    {room_no: 6,capacity: 500},
    {room_no: 7,capacity: 400}] 
  desc "TODO"
  task create_new_room: :environment do
    rooms.each do |room|
			@room =  Room.new(room_no: room[:room_no],capacity: room[:capacity])
      @room.save
    end
  end
end
