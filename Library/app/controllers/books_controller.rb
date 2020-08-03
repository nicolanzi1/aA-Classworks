class BooksController < ApplicationController
    def index
        @books = Book.all
        # render json: books
        render :index
    end

    def show
        @book = Book.find_by(id: params[:id])
        # render json: @book
        # render :show
        if @book
            render :show
        else
            # return user to index page
            # render :index
            redirect_to books_url

            # another less common option would be:
            # unless @book
            #     redirect_to books_url
            #     return
            # end
            # render :show
        end
    end

    def new
        @book = Book.new
        render :new
    end

    def create
        @book = Book.new(book_params)
        # params = { book: { title: 'HP', } }
        # params = { user: { name: 'claire', admin: true } }

        if @book.save
            # show user the book show page
            redirect_to book_url(@book)
        else
            # show the user the new book form
            render :new
        end
    end

    def edit
        @book = Book.find_by(id: params[:id])
        render :edit
    end

    def update
        @book = Book.find_by(id: params[:id])

        if @book.update_attributes(book_params)
            redirect_to book_url(@book)
        else
            render :edit
        end
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :year, :category, :description)
    end
end