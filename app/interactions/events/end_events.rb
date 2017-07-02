module Events
  class EndEvents < ActiveInteraction::Base
    def execute
      time = DateTime.current
      Event.where(:end_time.lte => time).
        update_all(status_cd: Event.statuses[:ended])
    end
  end
end
