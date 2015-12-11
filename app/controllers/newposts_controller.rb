class NewpostsController < ApplicationController
  before_action :set_newpost, only: [:show, :edit, :update, :destroy]
  # GET /newposts
  # GET /newposts.json
  def index
   if params[:search]
    @newposts = Newpost.search(params[:search]).paginate(page: params[:page], :per_page => 15)
    unless @newposts.present?
      redirect_to nill_url
    end
   end

  if params[:tag]
    @newposts = Newpost.tagged_with(params[:tag]).paginate(page: params[:page], :per_page => 15)
  end
  end
  # GET /newposts/1.json
  def show
    #counting every showtime
    if :show
      @newpost.update(count: (@newpost.count.to_i + 1))
    end
  end
  
  # GET /newposts/new
  def new
    if logged_in?
      if current_user.admin?
        @newpost = Newpost.new
      end
    else
      redirect_to root_path, alert: 'Access Denied'
    end
  end

  # GET /newposts/1/edit
  def edit
  end

  # POST /newposts
  # POST /newposts.json
  #Only admin could use this action
  def create
    if logged_in?
      if current_user.admin?
        @newpost = Newpost.new(newpost_params)
        respond_to do |format|
          if @newpost.save
            format.html { redirect_to @newpost, notice: 'Newpost was successfully created.' }
            format.json { render :show, status: :created, location: @newpost }
          else
            format.html { render :new }
            format.json { render json: @newpost.errors, status: :unprocessable_entity }
           end
        end
      else
        redirect_to root_path
      end
    end
  end

  # PATCH/PUT /newposts/1
  # PATCH/PUT /newposts/1.json
  #Only admin could use this action
  def update
    if logged_in?
      if current_user.admin?
        respond_to do |format|
          if @newpost.update(newpost_params)
            format.html { redirect_to @newpost, notice: 'Newpost was successfully updated.' }
            format.json { render :show, status: :ok, location: @newpost }
          else
            format.html { render :edit }
            format.json { render json: @newpost.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to root_path
      end
    end
  end

  # DELETE /newposts/1
  # DELETE /newposts/1.json
  #Only admin could use this action
  def destroy
    if current_user.admin?
      @newpost.destroy
      respond_to do |format|
        format.html { redirect_to newposts_url, notice: 'Newpost was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newpost
      @newpost = Newpost.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newpost_params
      params.require(:newpost).permit(:title, :description, :image_url, :keyword, :count,:tag_list)
    end

end
