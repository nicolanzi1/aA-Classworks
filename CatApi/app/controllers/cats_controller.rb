class CatsController < ApplicationController
    def index
        # GET /cats
        @cats = Cat.all
        render :index
    end

    def show
        # GET /cats/123
        @cat = Cat.find(params[:id])
        render :show
    end

    # 1. GET request for blank /cats/new form
    # 2. POST to /cats
    # 3. Validation fails
    # 4. Server will render the new template again
    # 5. The form is filled in with @cat data

    def create
        # POST /cats
        # Content-Length: ...
        #
        # { "cat": { "name": "Sally" } }

        @cat = Cat.new(params[:cat].permit(:name, :skill))

        if @cat.save
            # cat_url == /cats/...
            redirect_to cat_url(@cat)
        else
            # redirect_to new_cat_url
            render :new
            # render json: @cat.errors.full_messages, status: :unprocessable_entity
        end
    end

    # 1. GET /cats/new to fetch a form
    # 2. User fills out form, clicks submit
    # 3. POST /cats the data in the form
    # 4. Create action is invoked, cat is created
    # 5. Send client a redirect to /cats/#{id}
    # 6. Client makes a GET request for /cats/#{id}
    # 7. Show action for newly created cat is invoked

    def new
        # /cats/new
        # show a form to create a new object
        @cat = Cat.new
        render :new
    end

    def update
        cat = Cat.find(params[:id])
        # If I upload an admin attribute, this tries to set cat.admin
        cat.update(params[:cat].permit(:name))
        # ...
    end

    def edit
        # /cats/:id/edit
        # show a form to edit an existing object


    end

    def destroy
        # DELETE /cats/:id
        cat = Cat.find(params[:id])
        cat.destroy
        redirect_to cats_url

        # 1. GET /cats
        # 2. Click delete button
        # 3. Sends POST to /cats/123; but _method="DELETE" so rails understands
        #    to do a destroy
        # 4. Destroys the cat. Issues to redirect to the client
        # 5. Client GETs /cats again
    end
end