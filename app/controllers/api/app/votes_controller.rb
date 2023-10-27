class Api::App::VotesController < ApplicationController
  #before_action :authenticate_api_app_user!, only: %i[ create update destroy ]
  before_action :set_vote, only: %i[ show update destroy ]

  # GET /votes
  def index
    if params[:vote_type].present? && params[:content_type].present? && params[:content_id].present?
      @votes = Vote.where(
        vote_type: params[:vote_type],
        content_type: params[:content_type],
        content_id: params[:content_id]
      )
    else
      @votes = Vote.all
    end
    render json: @votes
  end

  # GET /votes/1
  def show
    render json: @vote
  end

  # POST /votes
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1
  def update
    if @vote.update(vote_params)
      render json: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  def destroy
    @vote.destroy
  end

  def delete_by_criteria
    # Find the vote to be removed based on the criteria (user_id, content_id, vote_type)
    @vote = Vote.find_by(user_id: params[:user_id], content_id: params[:content_id], vote_type: params[:vote_type], content_type: params[:content_type])

    if @vote
      @vote.destroy
      render json: { message: 'Vote removed successfully' }
    else
      render json: { error: 'Vote not found' }, status: :not_found
    end
  end
  # COUNT /votes
  def count
    if params[:vote_type].present? && params[:content_type].present? && params[:content_id].present?
      @count = Vote.where(
        vote_type: params[:vote_type],
        content_type: params[:content_type],
        content_id: params[:content_id]
      ).count
    else
      @count = Vote.count
    end

    render json: { count: @count }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:content_id, :user_id, :content_type, :vote_type)
    end
end
