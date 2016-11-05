This is the repo of the BDD course with Rails 5 - Alpha blog

Server
In cloud 9:
$ rails s -b $IP -p $PORT

Features:
* Real-Time Chat in Comments Section

Technologies Used:

Ruby
Rails 5
* Action Cable
* RSpec
* Capybara
* Devise


Guard
// to run
$ cucumber --init
$ guard

// to set up
$ bundle binstubs guard
$ guard init
$ cucumber --init

ActionCable

for cloud9:
app > config > development > development.rb
  config.action_cable.disable_request_forgery_protection = true

this line allows ActionCable to accept requests from all ports, not just :3000. Cloud 9 uses :8080


https://github.com/easante/blog-app5