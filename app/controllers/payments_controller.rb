class PaymentsController < ApplicationController
    def new
        @payment = current_user.payments.build
    end

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
    
      private
    
      def payment_params
        params.require(:payment).permit(:name,:amount, :date, :payment_method, :category_id)
      end
end