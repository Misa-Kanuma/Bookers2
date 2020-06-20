class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.save
		redirect_to books_path
	end

   	def show
    	@books = Book.all
   		@book = Book.find(params[:id])
   end

   def edit
   		@book = Book.find(params[:id])
   end

private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
