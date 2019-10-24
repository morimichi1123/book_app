class BooksController < ApplicationController
    def new
      @book = Book.new
    end

    def edit
      @book = Book.find(params[:id])
    end

    def update
      @book = Book.find(params[:id])
      if @book.update_attributes(book_params)
        flash[:success] = "Book Information Updated"
        redirect_to @book
      else
        render 'edit'
      end
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:success] = "Success Add New Book"
            redirect_to @book
          else
            render 'new'
        end
    end

    def book_params
      params.require(:book).permit(:title, :author, :publisher, :genre)
    end

    def show
      @book = Book.find(params[:id])
    end

    def list
      @books = Book.paginate(page: params[:page]).search(params[:search])
    end

    def destroy
      Book.find(params[:id]).destroy
      flash[:success] = "Book deleted"
      redirect_to list_path
    end
end
