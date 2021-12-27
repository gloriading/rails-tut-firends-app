# README

- This is a Ruby on Rails learning project

- Command used:

```
# Create a controller
rails g controller home index

# Create a CRUD
rails g scaffold friends first_name:string last_name:string email:string phone:string address:string

# Create the schema
rails db:migrate

# To install a gem, add to Gemfile and do
bundle install


```

- User sign up /sign in

1. copy and past `gem 'devise', '~> 4.8', '>= 4.8.1'` to Gemfile
2. run `rails generate devise:install`

---

Depending on your application's configuration some manual setup may be required:

1. Ensure you have defined default url options in your environments files. Here
   is an example of default_url_options appropriate for a development environment
   in config/environments/development.rb:

   config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

   In production, :host should be set to the actual host of your application.

   - Required for all applications. \*

2. Ensure you have defined root*url to \_something* in your config/routes.rb.
   For example:

   root to: "home#index"

   - Not required for API-only Applications \*

3. Ensure you have flash messages in app/views/layouts/application.html.erb.
   For example:

     <p class="notice"><%= notice %></p>
     <p class="alert"><%= alert %></p>

   - Not required for API-only Applications \*

4. You can copy Devise views (for customization) to your app by running:

   rails g devise:views

---

3. Create db `rails generate devise user` & `rails db:migrate`

## Associations

- models/friend.rb, add `belongs_to :user`
- models/user.rb, add `has_many :friends`
- create new migration to add a column in friends table: -

  ```
     rails g migration add_user_id_to_friends user_id:integer:index
     rails db:migrate
  ```

- to get user id, use `current_user.id` from devise
- add `user_id` to the permit param in friends_controller

## References

- Supported data types: https://guides.rubyonrails.org/v3.2/migrations.html
- Ruby gems: https://rubygems.org/
- Speicl install for `devise` gem: https://github.com/heartcombo/devise
