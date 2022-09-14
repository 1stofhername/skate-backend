class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/login/:email&:password' do
    User.validate_user(params["email"], params["password"]).to_json
  end

  get "/skateparks" do
    skateparks = Skatepark.all
    skateparks.to_json(include: {
      users: { only: [:id, :first_name, :last_name, :category_id]}
    })
  end

  get "/skateparks/:id" do
    @skatepark = Skatepark.find(params["id"])
    @skatepark.to_json
  end

  patch "/users/checkout/:id" do
    user = User.find(params[:id])
    user.update(
      checkedIn: params[:checkedIn],
      skatepark_id: params[:skatepark_id]
    )
    user.to_json
  end

  patch "/users/checkin/:id" do
    @user = User.find(params[:id])
    @skatepark_id = Skatepark.get_id_by_name(params[:skatepark_name])
    @category_id = Category.get_id_by_name(params[:category_name])
    @user.update(
      checkedIn: true,
      skatepark_id: @skatepark_id,
      category_id: @category_id
    )
    @user.to_json
  end  

  post "/users/signup" do
    user = User.create(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      password: params[:password],
      checkedIn: false
    )
    user.to_json
  end

end
