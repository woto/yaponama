# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

 every 5.minutes do
   rake "app:notify"
 end

 #every 10.minute do
 #  command "cd #{path}/system/ && node ./static_builder.js >> #{path}/log/static_builder.log"
 #end

 every 10.minute do
   command "cd #{path}/system/ && $(lockfile -r 0 ./static_builder.lock) || exit 1 && $(which node) ./static_builder.js >> #{path}/log/static_builder.log && $(rm -f ./static_builder.lock)"
 end

 every 1.day do
  rake "app:clear_old_sessions"
 end

# Learn more: http://github.com/javan/whenever
