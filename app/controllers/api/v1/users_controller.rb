class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]
   
    def index
      @users = User.all
      render json: @users
    end

    # def show
    #   user = User.find(params[:id])
    #   render json: user
    # end

    def show
      user = User.find(params[:id])
      myEvents = user.events.map { |e| EventSerializer.new(e) }
      myContacts = user.contacts.map { |c| ContactSerializer.new(c) } 
      myUser = UserSerializer.new(user)
      render json: {user: myUser, contacts: myContacts, events: myEvents}
    end

    def profile
      #token = request.headers['Authentication'].split(' ')[1]
      token = decode(request.headers["Authentication"])
      user_id = token["user_id"]
      user = User.find(user_id)
      myEvents = user.events.map { |e| EventSerializer.new(e) }
      myContacts = user.contacts.map { |c| ContactSerializer.new(c) } 
      myUser = UserSerializer.new(user)
      render json: {user: myUser, contacts: myContacts, events: myEvents}
    end
   
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), token: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
   
    private
    def user_params
      params.require(:user).permit(:username, :password, :first_name, :last_name, :avatar)
    end
  end
