class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to users_path
	end

   def index
   	@users = User.all
   	@user = current_user
   end

   def show
    @users = User.all
    @user = User.find(params[:id])
    @books = Book.all
   end

   def edit
   	@user = User.find(params[:id])
   end

   def update
   	@user = User.find(params[:id])
   	@user.update(user_params)
   	redirect_to user_path(@user.id)
   end


private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end