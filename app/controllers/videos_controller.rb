class VideosController < ApplicationController

  respond_to :html, :json

  before_action :get_video, only: [:show, :update, :destroy]

  def index
    @videos = Video.all
    respond_with @videos
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      render json: @video, status: :ok
    else
      render json: {video: @video.errors, status: :no_content}
    end
  end

  def show
    respond_with @video
  end

  def update
    if @video.update_attributes(video_params)
      render json: @video, status: :ok
    else
      render json: {video: @video.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @video.destroy
    render json: {status: :ok}
  end

  private
  def video_params
    params.fetch(:video, {}).permit(:video_url, :team, :season, :event, :school)
  end

  def get_video
    @video = Video.find(params[:id])
    render json: {status: :not_found} unless @video
  end
end
