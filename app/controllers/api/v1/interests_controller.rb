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
    byebug
      interest = Interest.create(name: params[:name])
      interest_contact = ContactInterest.create(contact_id: params[:contact_id], interest_id: interest.id)
      render json: interest
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
          params.require(:interest).permit(:id, :name, :contact_id)
      end
  end
  
