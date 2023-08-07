class OrdersController < ApplicationController
  before_action :redirect_to_sign_in
  before_action :set_item
  before_action :set_public_key

  def index
    @order_delivery = OrderDelivery.new
    redirect_to_top_page
  end
  
  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
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

  def redirect_to_top_page
    if @item.order != nil || (user_signed_in? && current_user.id == @item.user.id)
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_public_key
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def order_params
    params.require(:order_delivery).permit(
      :post_code,
      :prefecture_id,
      :municipalities,
      :house_number,
      :building,
      :phone_number
    ).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
