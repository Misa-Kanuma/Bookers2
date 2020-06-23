class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		if @user.save
		      redirect_to users_path
    else
          render :new
    end
	end

   def index
   	@users = User.all
   	@user = User.find_by(id: current_user.id)
    @newbook = Book.new
   end

   def show
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
   end

   def edit
   	@user = User.find(params[:id])
   end

   def update
   	@user = User.find(params[:id])
   	if @user.update(user_params)
   	    redirect_to user_path(@user.id), notice: "You have updated book successfully."
    else
        render 'edit'
    end
   end


private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end