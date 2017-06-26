module Courts
  class CreateUpcomingEvents < ActiveInteraction::Base
    object :court

    def execute
      court.recurrent_events.map do |recurrent_event|
        create_upcoming_event(recurrent_event)
      end
    end

    private

    def create_upcoming_event(recurrent_event)
      event_date = Montrose.recurrence(recurrent_event.recurrence).take(1).first
      court.events.build(
        status: Event.statuses[:upcoming],
        start_time: event_date,
        end_time: event_date + recurrent_event.duration
      )
    end
  end
end
