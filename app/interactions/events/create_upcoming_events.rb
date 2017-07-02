module Events
  class CreateUpcomingEvents < ActiveInteraction::Base
    object :court

    def execute
      court.recurrent_events.map do |recurrent_event|
        start_at = Montrose.recurrence(recurrent_event.recurrence).take(1).first
        end_at = start_at + recurrent_event.duration
        create_upcoming_event(start_at, end_at)
      end
    end

    private

    def create_upcoming_event(start_at, end_at)
      return if overlapping_event?(start_at, end_at)
      court.events.create(
        status: :upcoming,
        start_time: start_at,
        end_time: end_at
      )
    end

    def overlapping_event?(start_at, end_at)
      court.events.where(
        status_cd: Event.statuses[:upcoming],
        :start_time.lt => end_at,
        :end_time.gt => start_at
      ).any?
    end
  end
end
