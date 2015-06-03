class AlbumsController < ApplicationController

  before_action :find_album, except: [ :index, :new, :create ]

  def find_album
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.all
  end

  def show
    #uses find_album
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album), notice: 'Updated Album'
    else
      render :new
    end
  end

  def edit; end

  def update
    #uses find_album
    if @album.update_attributes(album_params)
      redirect_to albums_url
    else
      render :edit
    end
  end

  def destroy
    #uses find_album
    @album.destroy
    redirect_to albums_url
  end

  def album_params
    params.require(:album).permit(:name)
  end
end
