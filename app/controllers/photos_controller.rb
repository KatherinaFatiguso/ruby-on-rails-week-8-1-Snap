class PhotosController < ApplicationController
  before_action :find_album
  before_action :find_photo, except: [ :index, :new, :create ]

  def find_album
    @album = Album.find(params[:album_id])
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def index
    @photos = @album.photos
  end

  def edit;end

  def update
    if @photo.update_attributes(photo_params)
      redirect_to album_photos_path(@album)
    else
      render :edit
    end
  end

  def destroy
    #uses find_album, find_photo
    @photo.destroy
    redirect_to album_photos_path(@album)
  end

  def photo_params
    params.require(:photo).permit(:filename, :description)
  end

end
