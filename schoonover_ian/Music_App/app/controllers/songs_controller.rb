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
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])

    if @song.update(song_params)
      redirect_to artist_songs_path(@artist)
   else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to artist_songs_path(@artist)
  end

  private
  def song_params
  	params.require(:song).permit(:title)
  end

end
