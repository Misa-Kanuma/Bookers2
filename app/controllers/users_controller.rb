class UsersController < ApplicationController

   def index
   	@users = User.all
   	@user = current_user
   end

   def show
    @users = User.all
   	@user = User.find(params[:id])
   end

   def edit
   	@user = User.find(params[:id])
   end

private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end