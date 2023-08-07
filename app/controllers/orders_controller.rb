class OrdersController < ApplicationController
  before_action :redirect_to_sign_in
  before_action :item_set

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_delivery = OrderDelivery.new
    redirect_seller_user
  end
  
  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def redirect_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def redirect_seller_user
    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_delivery).permit(
      :post_code,
      :prefecture_id,
      :municipalities,
      :house_number,
      :building,
      :phone_number
    ).merge(item_id: @item.id, user_id: current_user.id)
  end

end
