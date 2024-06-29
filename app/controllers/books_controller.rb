class BooksController < ApplicationController
  def new
    @book = Book.all
  end

  def index
    @book = Book.all
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end