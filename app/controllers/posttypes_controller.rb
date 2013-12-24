class PosttypesController < ApplicationController
  before_action :set_posttype, only: [:show, :edit, :update, :destroy]

  # GET /posttypes
  # GET /posttypes.json
  def index
    @posttypes = Posttype.all
  end

  # GET /posttypes/1
  # GET /posttypes/1.json
  def show
  end

  # GET /posttypes/new
  def new
    @posttype = Posttype.new
  end

  # GET /posttypes/1/edit
  def edit
  end

  # POST /posttypes
  # POST /posttypes.json
  def create
    @posttype = Posttype.new(posttype_params)

    respond_to do |format|
      if @posttype.save
        format.html { redirect_to @posttype, notice: 'Posttype was successfully created.' }
        format.json { render action: 'show', status: :created, location: @posttype }
      else
        format.html { render action: 'new' }
        format.json { render json: @posttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posttypes/1
  # PATCH/PUT /posttypes/1.json
  def update
    respond_to do |format|
      if @posttype.update(posttype_params)
        format.html { redirect_to @posttype, notice: 'Posttype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @posttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posttypes/1
  # DELETE /posttypes/1.json
  def destroy
    @posttype.destroy
    respond_to do |format|
      format.html { redirect_to posttypes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posttype
      @posttype = Posttype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def posttype_params
      params.require(:posttype).permit(:name)
    end
end
