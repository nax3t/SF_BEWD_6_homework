class SongsController < ApplicationController
  def index
  	@artist = Artist.find(params[:artist_id])
  	@songs = @artist.songs.all
  end

  def new
  	@artist = Artist.find(params[:artist_id])
  	@song = Song.new
  end

  def create
  	@artist = Artist.find(params[:artist_id])
  	song = @artist.songs.create(song_params)
  	redirect_to artist_songs_path(@artist)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:artist_id])

    if @song.update(song_params)
      redirect_to artists_path
   else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = Song.destroy
  end

  private
  def song_params
  	params.require(:song).permit(:title)
  end

end
