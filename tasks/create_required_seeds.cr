require "../spec/support/boxes/**"

# Add seeds here that are *required* for your app to work.
# For example, you might need at least one admin user or you might need at least
# one category for your blog posts for the app to work.
#
# Use `Db::CreateSampleSeeds` if your only want to add sample data helpful for
# development.
class Db::CreateRequiredSeeds < LuckyCli::Task
  summary "Add database records required for the app to work"

  def call
    # Using a Avram::Box:
    #
    # Use the defaults, but override just the email
    # UserBox.create &.email("me@example.com")

    # Using a SaveOperation:
    #
    # SaveUser.create!(email: "me@example.com", name: "Jane")
    #
    # You likely want to be able to run this file more than once. To do that,
    # only create the record if it doesn't exist yet:
    #
    # unless UserQuery.new.email("me@example.com").first?
    #  SaveUser.create!(email: "me@example.com", name: "Jane")
    # end

    email = "andy@example.com"
    attributes = {
      email: email,
      password: "password10",
      password_confirmation: "password10",
    }

    unless UserQuery.new.email(email).first?
      SaveUser.create!(**attributes)
    end


    puts "Done adding required data, existing user:"
    pp UserQuery.new.email(email).first
  end
end
