class BooksController < ApplicationController
  def new
    @book = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.all
    @book_new = Book.new
  end

  def update
    is_matching_login_user
    book = Book.find(params[:id])

    user = User.new(book_params)
    if user.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(book.id)
    else
      render :index
    end
  end

  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to'/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end

end