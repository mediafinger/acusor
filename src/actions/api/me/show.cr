class Api::Me::Show < ApiAction
  get "/api/current_user" do
    json UserSerializer.new(current_user)
  end
end
