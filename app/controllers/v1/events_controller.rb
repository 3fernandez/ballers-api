module V1
  class EventsController < ApplicationController
    def index
      events = Event.all
      render json: events
    end

    def cancel
      event = Event.find(params[:id])
      Events::CancelEvent.run(
        event: event,
        reason: cancel_event_params[:cancelation_reason]
      )
      render json: event
    end

    private

    def cancel_event_params
      params.require(:event).permit(:cancelation_reason)
    end
  end
end
