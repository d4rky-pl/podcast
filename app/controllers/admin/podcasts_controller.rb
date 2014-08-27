class Admin::PodcastsController < ApplicationController
  include Administrable
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]

  # GET /admin/podcasts
  def index
    @podcasts = Podcast.page(params[:page]).per(params[:per_page])
  end

  # GET /admin/podcasts/1
  def show
  end

  # GET /admin/podcasts/new
  def new
    @podcast = Podcast.new
  end

  # GET /admin/podcasts/1/edit
  def edit
  end

  # POST /admin/podcasts
  def create
    @podcast = current_admin.podcasts.new(podcast_params)

    if @podcast.save
      redirect_to [:admin, @podcast], notice: 'Podcast was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/podcasts/1
  def update
    if @podcast.update(podcast_params)
      redirect_to [:admin, @podcast], notice: 'Podcast was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/podcasts/1
  def destroy
    @podcast.destroy
    redirect_to admin_podcasts_url, notice: 'Podcast was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def podcast_params
      params.require(:podcast).permit(:title, :description, :stream, :admin_id, :published, :stream_cache)
    end
end
