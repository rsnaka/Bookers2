class BooksController < ApplicationController
  def new
    @book = Book.all
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
    redirect_to book_path(book)
    else
      render :new
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = @book.user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.all
  end

  def update
    is_matching_login_book
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
    is_matching_login_book
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

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.id == current_book.id
      redirect_to books_path
    end
  end

end