class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
		@user = User.find_by(id: current_user.id)
	end

	def create
		@book = Book.new(book_params)
		@book.user = current_user
		if @book.save
		       redirect_to book_path(@book.id)
	   else
         render :new
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
   	redirect_to book_path(@book.id)
   end


private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
