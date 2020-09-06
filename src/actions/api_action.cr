# Include modules and add methods that are for all API requests
abstract class ApiAction < Lucky::Action
  disable_cookies
  accepted_formats [:json], default: :json

  # instead of using version numbers as a route namespace like /v1
  # implement the Stripe API Versioning pattern
  # which relies on a date-stamp in an HTTP header
  # and defines changesets to handle outdated parameters
  # or to send a response in an outdated format
  # https://stripe.com/blog/api-versioning
  # https://stripe.com/docs/api/versioning
  # https://stripe.com/docs/upgrades
  # route_prefix "/api/"

  include Api::Auth::Helpers

  # By default all actions require sign in.
  # Add 'include Api::Auth::SkipRequireAuthToken' to your actions to allow all requests.
  include Api::Auth::RequireAuthToken
end
