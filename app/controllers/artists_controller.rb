class ArtistsController < ApplicationController
	def index
    	@search = params[:search]
    	@artists = @search ? Artist.search(@search) : Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      flash.now[:error] = @artist.errors.messages.first.join(" ")
      render 'new'
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      flash.now[:error] = @artist.errors.messages.first.join(" ")
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artist_path
  end


  private

  def artist_params
    params.require(:artist).permit(:name, :nationality, :dob, :image)
  end
end
