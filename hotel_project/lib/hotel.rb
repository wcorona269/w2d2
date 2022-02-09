require_relative "room"

class Hotel

    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |room, capacity|
            @rooms[room] = Room.new(capacity)
        end
    end

    def name
        capitalized = @name.split(" ").map {|ele| ele.capitalize }
        capitalized.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end


    def check_in(person, room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(person)
                puts "check in successfull!"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        !@rooms.all? { |room, capacity| @rooms[room].full? }
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name} : #{room.available_space}"
        end
    end
end




