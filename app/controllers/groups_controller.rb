class GroupsController < ApplicationController

    #method to display group records for a particular user
    def my_index
        @groups = current_user.groups
    end

    #method to display all group records
    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
          redirect_to root_path, notice: "group was successfully created."
        else
            # flash[:alert] = "Invalid payment details"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @group = Group.find(params[:id])
        @group.users.delete(current_user)
        redirect_to root_path, notice: "Successfully left the group."
    end

    def join
        @group = Group.find(params[:id])
        if @group.users.include?(current_user)
            flash[:alert] = "User has already joined this group"
            redirect_to view_all_group_path
        else
            @group.users << current_user
            redirect_to root_path, notice: "Joined a group successfully"
        end
    end

    private
    
      def group_params
        params.require(:group).permit(:name)
      end
end