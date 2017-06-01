namespace :todo do
  desc "Delete events that have already passed"
  task delete_events: :environment do
    Event.where("date < ?", Date.today).destroy_all
  end

end
