class PaymentsController < ApplicationController
    def new
        @payment = current_user.payments.build
    end

    #method to display all payment records
    def index
        @payments = current_user.payments
    end

    def create
        @payment = current_user.payments.build(payment_params)
        if @payment.save
          redirect_to root_path, notice: "Payment was successfully added."
        else
            # flash[:alert] = "Invalid payment details"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @payment = current_user.payments.find(params[:id])
        @payment.destroy
        redirect_to root_path, notice: "Payment was successfully deleted."
    end

    def edit
        @payment = current_user.payments.find(params[:id])
    end

    def update
        @payment = current_user.payments.find(params[:id])
        if @payment.update(payment_params)
          redirect_to root_path, notice: "Payment was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
    end
      
      private
    
      def payment_params
        params.require(:payment).permit(:name,:amount, :date, :payment_method, :category_id)
      end
end