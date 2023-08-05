class OrdersController < ApplicationController
  before_action :redirect_to_sign_in

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    user_check
  end
  
  def create
  end

  private

  def redirect_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def user_check
    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end
  end

end
