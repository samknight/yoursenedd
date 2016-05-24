desc "This task is called by the Heroku scheduler add-on"
task :update_debates => :environment do
  puts "Updating debates..."
  dates = Import.available_days(Debate.first.log_date + 1.day..Date.today)
  dates.each do |date|
    Import.new(date).save!
  end
  puts "done."
end
