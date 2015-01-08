class BlogsController < ApplicationController
  layout "front", only: [:show]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
    @blogs = Blog.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to @blog, notice: 'Page was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Page was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  def destroy
    @blog.destroy
    redirect_to paginas_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :slug, :image)
    end
end
