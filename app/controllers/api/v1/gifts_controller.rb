class Api::V1::GiftsController < ApplicationController
  before_action :get_gift, only: [:destroy, :update]
      def index
          gifts = Gift.all
          render json: GiftSerializer.new(gifts)
      end

      def show
          gift = Gift.find(params[:id])
          render json: GiftSerializer.new(gift)
      end


      def create
          gift = Gift.create(gift_params)
          render json: gift
      end

      def update
        @gift.update(gift_params[:gift])
        render json: gift
      end


      def destroy
        gift = @gift
        @gift.destroy
        render json: gift, status: :accepted
      end
    
  
      private
    
      def gift_params
        params.require(:gift).permit(:id, :name, :price, :given, :rating, :link, :event_id, :contact_id)
      end
end
