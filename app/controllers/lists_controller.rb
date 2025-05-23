class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if params[:list][:image].present?
      uploaded = Cloudinary::Uploader.upload(params[:list][:image])
      @list.image = uploaded["public_id"]
    end
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
