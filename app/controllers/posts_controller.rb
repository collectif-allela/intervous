# module Api
#   module App
    # class Api::App::PostsController
    class Api::App::PostsController < ApplicationController
      before_action :set_post, only: %i[ show update destroy ]

      # GET /posts
      def index
        if params[:created_at].present?
          date = Date.parse(params[:created_at])
          start_of_day = date.beginning_of_day
          end_of_day = date.end_of_day
          @posts = Post.where(created_at: start_of_day..end_of_day)
          # @posts = Post.where(created_at: params[:created_at])
        else
          @posts = Post.all
        end
        render json: @posts
      end

      # GET /posts/1
      def show
        render json: @post
      end

      # POST /posts
      def create
        @post = Post.new(post_params)

        if @post.save
          render json: @post, status: :created, location: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /posts/1
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # DELETE /posts/1
      def destroy
        @post.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_post
          @post = Post.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def post_params
          params.require(:post).permit(:id, :video_url)
        end
    end
#   end
# end
