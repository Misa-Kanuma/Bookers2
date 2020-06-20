class BooksController < ApplicationController

	def index
		@books = Book.all
   		@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@user.save
		redirect_to_book_path(book.id)
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
