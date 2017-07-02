namespace :events do
  desc "Create upcoming events for each court"
  task create_upcoming_events: :environment do
    Court.all.map do |court|
      Events::CreateUpcomingEvents.run!(court: court)
    end
  end
end
