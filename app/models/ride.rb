class Ride < ActiveRecord::Base
    belongs_to :user 
    belongs_to :attraction

    def take_ride
        if eligible ==  "Thanks for riding the #{attraction.name}!"
            alter_all
        else 
            eligible
        end
    end

    def eligible 
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height 
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        elsif self.user.height < self.attraction.min_height 
             "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif  self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
            "Thanks for riding the #{attraction.name}!"
        end
    end

    def alter_all
    self.user.update(
        happiness: self.user.happiness += self.attraction.happiness_rating,
        nausea: self.user.nausea += self.attraction.nausea_rating,
        tickets: self.user.tickets -= self.attraction.tickets
        )
    end
end
