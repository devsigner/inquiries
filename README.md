# Inquiries

This gem logs inquiries (via contact form) and sends email notifications for those inquiries.

### Installation

In your Gemfile, add this line:

    gem "inquiries"

Then, run `bundle install`.

Run the generator and migrate:

    rails g inquiries
    rake db:migrate

This will generate a config file and migration to create the inquiries table.

You can customize the inquiry settings in config/inquiries.yml.

You can override any of the views and mailers by duplicating them in your own application and making your changes.