class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  helper_method :getallpost
  # GET /posts
  # GET /posts.json
  def index
   if params[:search]
    @posts = Post.search(params[:search]).paginate(page: params[:page], :per_page => 15).order('created_at DESC')
    unless @posts.present?
      redirect_to nill_url
    end
   end

  if params[:tag]
    @posts = Post.tagged_with(params[:tag]).paginate(page: params[:page], :per_page => 15)
  end
  end

  # GET /posts/1.json
  def show
    #counting every showtime
    if :show
      @post.update(count: (@post.count.to_i + 1))
    end
  end
  
  # GET /posts/new
  def new
    if logged_in?
      if current_user.admin?
        @post = Post.new
      end
    else
      redirect_to root_path, alert: 'Access Denied'
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  #Only admin could use this action
  def create
    if logged_in?
      if current_user.admin?
        @post = Post.new(post_params)
        respond_to do |format|
          if @post.save
            format.html { redirect_to @post, notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @post }
          else
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
           end
        end
      else
        redirect_to root_path
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  #Only admin could use this action
  def update
    if logged_in?
      if current_user.admin?
        respond_to do |format|
          if @post.update(post_params)
            format.html { redirect_to @post, notice: 'Post was successfully updated.' }
            format.json { render :show, status: :ok, location: @post }
          else
            format.html { render :edit }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to root_path
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  #Only admin could use this action
  def destroy
    if current_user.admin?
      @post.destroy
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :image_url, :keyword, :count,:tag_list)
    end

end
