class ActualitiesController < ApplicationController
  before_action :set_actuality, only: %i[ show update destroy ]

  # GET /actualities
  def index
    @actualities = Actuality.all

    render json: @actualities
  end

  # GET /actualities/1
  def show
    render json: @actuality
  end

  # POST /actualities
  def create
    @actuality = Actuality.new(actuality_params)

    if @actuality.save
      render json: @actuality, status: :created, location: @actuality
    else
      render json: @actuality.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /actualities/1
  def update
    if @actuality.update(actuality_params)
      render json: @actuality
    else
      render json: @actuality.errors, status: :unprocessable_entity
    end
  end

  # DELETE /actualities/1
  def destroy
    @actuality.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actuality
      @actuality = Actuality.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actuality_params
      params.require(:actuality).permit(:title, :post_id_id, :video_url, :body, :summary, :tag)
    end
end
