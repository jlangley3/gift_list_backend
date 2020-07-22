class Api::V1::AuthController < ApplicationController
    # skip_before_action :authorized, only: [:create]
   
    def create
      @user = User.find_by(username: login_params[:username])
      #User#authenticate comes from BCrypt
      if @user && @user.authenticate(login_params[:password])
          # encode token comes from ApplicationController
          token = encode({user_id: @user.id})
          # token = encode({ user_id: @user.id })
          myEvents = @user.events.map { |e| EventSerializer.new(e) }
          myContacts = @user.contacts.map { |c| ContactSerializer.new(c) } 
          myUser = UserSerializer.new(@user)
          render json: {
            message: 'You are logged in',
            user: myUser,
            token: token,
            authenticated: true
            }, status: :accepted
        else
          render json: {
            message: 'Username and Password are No Good',
            authenticated: false
          }, status: :not_acceptable
        end
    end

      private
      def login_params
        params.require(:user).permit(:username, :password)
      end
end
