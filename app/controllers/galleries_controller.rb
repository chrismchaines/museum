class GalleriesController < ApplicationController
	def index
    	@search = params[:search]
    	@galleries = @search ? Gallery.search(@search) : Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      flash.now[:error] = @gallery.errors.messages.first.join(" ")
      render 'new'
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery)
    else
      flash.now[:error] = @gallery.errors.messages.first.join(" ")
      render 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to gallery_path
  end


  private

  def gallery_params
    params.require(:gallery).permit(:name, :city)
  end

end
