class PaintingsController < ApplicationController
	def index
    	@search = params[:search]
    	@paintings = @search ? Painting.search(@search) : Painting.all
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      redirect_to painting_path(@painting)
    else
      flash.now[:error] = @painting.errors.messages.first.join(" ")
      render 'new'
    end
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update(painting_params)
      redirect_to painting_path(@painting)
    else
      flash.now[:error] = @painting.errors.messages.first.join(" ")
      render 'edit'
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to painting_path
  end


  private

  def painting_params
    params.require(:painting).permit(:title, :year, :style, :image)
  end
end
