class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
  @list = List.find(params[:list_id])
  @bookmark = Bookmark.new(bookmark_params)
  @bookmark.list = @list

  if @bookmark.save
    redirect_to list_path(@list), notice: "ブックマークを追加しました！"
  else
    @bookmarks = @list.bookmarks # 🛠️ Needed for re-rendering
    render "lists/show", status: :unprocessable_entity
  end
  end


  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: "Bookmark was deleted."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
