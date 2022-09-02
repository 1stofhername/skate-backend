class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/login/:email&:password' do
    user = User.find_by(email: params["email"], password: params["password"])
    if user
      user.to_json
    else
      "User/password mismatch".to_json
    end

  end

  get "/skateparks" do
    skateparks = Skatepark.all
    skateparks.to_json
  end

end
