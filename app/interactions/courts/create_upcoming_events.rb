module Courts
  class CreateUpcomingEvents < ActiveInteraction::Base
    def execute
      Court.where("events.status.ne" => "upcoming").count
    end
  end
end
