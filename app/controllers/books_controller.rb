class BooksController < ApplicationController
  def index
    @book_all=Book.all.order(id: "ASC")
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end

  def create
    @book_all=Book.all
    @book=Book.new(book_params)
    if @book.save
      flash[:notice]="Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  
  def new

  end

  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book=Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else 
      render :edit
    end
  end
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    flash[:notice]='Book was successfully destroyed'
    redirect_to books_path
  end

  def top

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
