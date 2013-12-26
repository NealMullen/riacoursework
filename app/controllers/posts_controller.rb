class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
   before_action :prepare_categories
  before_action :prepare_posttypes




  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.search(params[:search]).paginate(:per_page => 4,:page => params[:page])
    session[:page] = params[:page]

    if(params[:search]) and (params[:search].present?)
      session[:search] = params[:search]
     else
      session.delete(:search)
    end
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
     @post = Post.find(params[:id])
  @posts=Post.all # needed for sidebar, probably better to use a cell for this
  respond_to do |format|
    format.html # show.html.erb
    format.js # show.js.erb
  end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :price, :posttype_id, :category_id)
    end

    def prepare_categories
      @categories = Category.all
    end

    def prepare_posttypes
      @posttypes = Posttype.all
    end


end
