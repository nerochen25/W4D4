class AlbumsController < ApplicationController
  def new
    @album = album.new
    render :new
  end

  def create
    @album = Band.new(album_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end
  private

  def album_params
    params.require(:album).permit(:album_title, :year)
  end

end
