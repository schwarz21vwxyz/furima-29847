class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :set_item, only: [:show,:edit,:update,:destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if  @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    if current_user.id ==  @item.user.id
      redirect_to root_path   
    end 
  end

  def show
  end

  def edit  
    redirect_to root_path if current_user.id !=  @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:comment,:category_id,:show_id,:delivery_id,:area_id,:day_id,:price).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end

end
