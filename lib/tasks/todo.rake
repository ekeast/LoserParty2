namespace :todo do
  desc "Delete events that have already passed"
  task delete_events: :environment do
    Event.destroy_all
  end

end
