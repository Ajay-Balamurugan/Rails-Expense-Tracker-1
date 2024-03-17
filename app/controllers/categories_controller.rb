class CategoriesController < ApplicationController
    def new
        @category = current_user.categories.build
    end

    def create
        @category = current_user.categories.build(category_params)
        if @category.save
          redirect_to root_path, notice: "category was successfully added."
        else
            # flash[:alert] = "Invalid payment details"
            render :new, status: :unprocessable_entity
        end
    end

    #method to display all category records
    def index
        @categories = current_user.categories
    end

    def destroy
        @category = current_user.categories.find(params[:id])
        @category.destroy
        redirect_to root_path, notice: "Payment was successfully deleted."
    end

    def edit
        @category = current_user.categories.find(params[:id])
    end

    def update
        @category = current_user.categories.find(params[:id])
        if @category.update(category_params)
          redirect_to root_path, notice: "Category was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
    end

    private
    
      def category_params
        params.require(:category).permit(:name,:budget)
      end
end 