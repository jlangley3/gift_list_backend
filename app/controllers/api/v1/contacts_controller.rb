class Api::V1::ContactsController < ApplicationController
        before_action :get_contact, only: [:destroy, :update]
        
        def index
            contacts = Contact.all
            render json: contacts
        end

        def show
            contact = Contact.find(params[:id])
            render json: ContactSerializer.new(contact)
        end
        

        def create
            contact = Contact.create(contact_params)
            render json: ContactSerializer.new(contact), status: :accepted
        end
        
        def update
          @contact.update(contact_params)
          
          render json: @contact
        end

        def destroy 
          contact = @contact
          @contact.destroy
          render json: contact, status: :accepted
        end
      
      
        private
        def get_contact
          @contact = Contact.find(params[:id])
        end
      
        def contact_params
          params.require(:contact).permit(:id, :birthday, :kind, :user_id, :avatar)
        end
      end
