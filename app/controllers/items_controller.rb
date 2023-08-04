class ItemsController < ApplicationController
  before_action :redirect_to_sign_in, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :info,
      :category_id,
      :item_status_id,
      :fee_status_id,
      :prefecture_id,
      :delivery_schedule_id,
      :price
    ).merge(user_id: current_user.id)
  end

  def redirect_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
