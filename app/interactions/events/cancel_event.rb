module Events
  class CancelEvent < ActiveInteraction::Base
    object :event
    string :reason

    def execute
      event.status = :cancelled
      event.cancelation_reason = reason
      event.save
      event
    end
  end
end
