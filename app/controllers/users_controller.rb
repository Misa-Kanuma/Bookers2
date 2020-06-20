class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.user_id = current_user.id
		@user.save
		redirect_to_user_path
	end

   def index
   	@users = User.all
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