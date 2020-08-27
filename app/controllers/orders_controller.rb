class OrdersController < ApplicationController
  before_action :login_check, only: [:index]
  before_action :owner_check, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = ShipAddressOrder.new
    @ship_address = @order.ship_addresses.new
  end

  def create 
    @order = ShipAddressOrder.new(order_params)
    if @order.valid?
      @order.save
      pay_item
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end


  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
 
  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

  def owner_check
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

end
