# Description

This is a tv guide setup application where you can search and mark tv show as favorite. Reminders will be sent for favorite users.

# Pre-requisites

1. Ruby 2.5.1
1. Rails 5+
1. Redis installed on your system for Sidekiq

# Setup

1. Clone this repository
2. `bundle install`
3. `bundle exec rake db:migrate`
4. `bundle exec rake db:seed`
5. Make sure redis is running for sidekiq jobs i.e `redis-cli`
6. Edit credentials `EDITOR=vi bin/rails credentials:edit` and add gmail credentials as per example file `config/credentials.example.yml` or change SMTP for email in `development.rb`
7. `bundle exec rails s`
8. Open localhost:3000 and proceed with the setup

# Approach

1. For reminders I have used sidekiq scheduler which runs every midnight and schedules reminders for the day by finding all tv shows marked as favorite for the day.
1. When the reminder executes it checks weather it is still marked as favorite by user else exits.
1. If all is good email is sent.

# Directory Structure

1. Home Controller is used for listing andd searching
1. `app/workers` contains the worker for reminders and individual email worker
1. `config/credentials` -> Credentials for gmail for email.
1. `config/sidekiq.yml` -> For scheduling main worker that finds out all reminders to be sent that day.
1. `config/development.rb` -> Contains all information of SMTP settings for email.
1. mailers, helpers and models you can find in default directories.

Please copy the settings to other environment files to reuse the code in other environments.

# Test

1. Basic validation tests added for tv shows.
1. <Rest are pending>