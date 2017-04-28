namespace :routine_tasks do
  desc 'Check if a routine has "expired" its frequency. If so, create logs for each routine_task and create the fresh routine.'
  task create_routine_task_logs: :environment do
    @routines = Routine.all
    @routines.each do |routine|
      #if routine.frequency > last_ran_hours_since_now
        routine.routine_logs.create
        routine.reset
      #else
        #return
     end
  end

  # desc 'send emails to all users with a list of upcoming and late reminders'
  # task email_reminders: :environment do

  #   @users = User.all.to_a

  #   @users.each do |user|
  #     late_reminders = []
  #     upcoming_reminders = []
  #     user.relationships.each do |rel| 
  #       upcoming_reminders += rel.reminders_due_in(8)
  #       late_reminders += rel.reminders_by_status('late')
  #     end

  #     email_address = user.email

  #     next if upcoming_reminders.empty? && late_reminders.empty?

  #     Mail.deliver do
  #       to email_address
  #       from 'elijahmurray@gmail.com'
  #       subject 'Your Daily Joylon Reminders'
  #       html_part do
  #         body ApplicationController.new.render_to_string('emails/_daily_reminders', locals: {upcoming_reminders: upcoming_reminders, late_reminders: late_reminders}, :layout => false)
  #       end
  #     end
  #   end
  # end
end
