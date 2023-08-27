# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


### Protect Resources:
To ensure that certain actions are only accessible to authenticated users, you can use Devise's authenticate_user! method in your controllers:
```ruby
before_action :authenticate_user!, except: [:index, :show]
```

### Add Links and UI Elements:
In your application's views, you can add links to sign up, log in, log out, and edit user profiles using Devise's helper methods. For example:
```ruby
<% if user_signed_in? %>
  <%= link_to 'Edit Profile', edit_user_registration_path %>
  <%= link_to 'Log Out', destroy_user_session_path, method: :delete %>
<% else %>
  <%= link_to 'Log In', new_user_session_path %>
  <%= link_to 'Sign Up', new_user_registration_path %>
<% end %>
```