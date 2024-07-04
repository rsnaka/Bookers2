class BooksController < ApplicationController
  def new
    @book = Book.all
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book)
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.all
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = book.find(params[:id])
    book.destroy
    redirect_to'/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end