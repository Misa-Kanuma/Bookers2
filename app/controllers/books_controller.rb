class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
		@user = User.find_by(id: current_user.id)
	end

	def create
		@book = Book.new(book_params)
		@book.user = current_user
      @books = Book.all
      @user = User.find_by(id: current_user.id)
		if @book.save
		       redirect_to book_path(@book.id), notice: "You have created book successfully."
	   else
         render 'index'
      end
   end

   	def show
    	@books = Book.all
   		@book = Book.find(params[:id])
   		@newbook = Book.new
		@user = @book.user
   end

   def edit
   		@book = Book.find(params[:id])
   end

   def destroy
   		@book = Book.find(params[:id])
   		@book.destroy
   		redirect_to books_path
   end

   def update
   	@book = Book.find(params[:id])
   	@book.update(book_params)
   	redirect_to book_path(@book.id), notice: "You have updated book successfully."
   end


private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
