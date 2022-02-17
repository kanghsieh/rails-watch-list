class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @list_bookmarks = Bookmark.where(list_id: params[:id])
    @movies = []
    Bookmark.all.each do |item|
      @movies << item.movie if item.list_id == params[:id].to_i
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
