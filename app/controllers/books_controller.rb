class BooksController < ApplicationController
    def show
    end

    def new
        @book = Book.new
    end

    def edit
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
end
