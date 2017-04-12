class PicsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @pics = Pic.all.order("created_at DESC")

  end
  
  def new
    #@pic = Pic.new
    @pic = current_user.pics.build
  end
  
  def create
    #@pic = Pic.new(pic_params)
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      redirect_to Pic.last
    else
      render 'new'
    end
  end
  
  def show
    @pic = Pic.find(params[:id])
    
  end
  
  def library
    @pic = current_user.pics.build
  end
  private
    
    def pic_params
      params.require(:pic).permit(:title, :description, :img)
    end
end
