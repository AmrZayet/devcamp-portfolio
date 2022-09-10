class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new 
    @blog = Blog.new #AZ-35: this is to make the form available to us
  end

  # GET /blogs/1/edit
  def edit #AZ-35: This is in the before_action list, but I don't know how this knows automatically to call update. learn how later.
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params) #AZ-35: this creates the blog using the parameters

    respond_to do |format| #AZ-35: learn more about format later.
      if @blog.save #AZ-35: checks if they are valid. learn more later
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        # format.html { redirect_to @blog, notice: "Blog was successfully created." } #AZ-35: this was the one he used in the course. It worked fine. learn more about Rails 5 vs Rails 7 later.
        format.json { render :show, status: :created, location: @blog } #AZ-35: this is not needed. It works completly fine without it.
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity } #AZ-35: this is not needed. It works completly fine without it.
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params) #AZ-35: this udates & checkes if updated. learn more later
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy #AZ-35: this will delete the record from the database

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body) #AZ-35: what is this? learn what later.
    end
end
