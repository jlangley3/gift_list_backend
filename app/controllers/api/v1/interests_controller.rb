class Api::V1::InterestsController < ApplicationController
  before_action :get_interest, only: [:destroy, :update]

    def index
      interests = Interest.all
      render json: InterestSerializer.new(interests)
  end

  def show
      interest = Interest.find(params[:id])
      render json: InterestSerializer.new(interest)
  end


  def create
      interest = Interest.create(interest_params)
      render json: InterestSerializer.new(interest), status: :accepted
  end

  def update
    @interest.update(interest_params[:interest])
    render json: InterestSerializer.new(@interest)
  end

  def destroy
    interest = @interest
    @interest.destroy
    render json: interest, status: :accepted
  end


  private
      def get_interest
          @interest = Interest.find(params[:id])
      end
  
      def interest_params
          params.require(:interest).permit(:id, :title, :start_date, :end_date, :budget, :repeating, user_id)
      end
  end
  
