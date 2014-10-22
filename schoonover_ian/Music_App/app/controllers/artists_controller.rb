class ArtistsController < ApplicationController
  def index
    @label = Label.find(params[:label_id])
    @artists = @label.artists.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @label = Label.find(params[:label_id])
    @artist = Artist.new
  end

  def create
    @label = Label.find(params[:label_id])
    @artist = @label.artists.create(artist_params)
    redirect_to label_artists_path(@label)
  end

  def edit
    @label = Label.find(params[:label_id])
    @artist = Artist.find(params[:id])
  end

  def update
    @label = Label.find(params[:label_id])
    @artist = @label.artists.find(params[:id])

    if @artist.update(artist_params)
      redirect_to label_artists_path(@label)
   else
      render 'edit'
    end
  end

  def destroy
    @label = Label.find(params[:label_id])
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to label_artists_path(@label)
  end
  
  private
  def artist_params
    params.require(:artist).permit(:name)
  end

end
