class ArtistsController < ApplicationController
  def index
    @label = Label.find(params[:label_id])
    @artists = @label.artists.all
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
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
      redirect_to artists_path
   else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path
  end
  
  private
  def artist_params
    params.require(:artist).permit(:name)
  end

end
