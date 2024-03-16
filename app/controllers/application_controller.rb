class ApplicationController < ActionController::Base
    before_action :set_current_user
    helper_method :current_user

    def set_current_user
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
    end 

    def current_user
        @user
    end
end
