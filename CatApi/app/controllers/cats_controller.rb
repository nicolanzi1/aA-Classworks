class CatsController < ApplicationController
    def index
        # GET /cats
        self.render json: Cat.all
    end

    def show
        self.render json: Cat.find(self.params[:id])
    end

    def create
        # POST /cats
        # Content-Length: ...
        #
        # { "cat": { "name": "Sally" } }

        cat = Cat.new(name: params[:cat].permit(:name))
        cat.admin = false

        if cat.save
            render json: cat
        else
            render json: cat.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        cat = Cat.find(params[:id])
        # If I upload an admin attribute, this tries to set cat.admin
        cat.update(params[:cat].permit(:name))
        # ...
    end

    def destroy
        # if !current_cat_user.admin
        #     raise "error"
        # end
        # ...
    end
end