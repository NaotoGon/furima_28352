class OrdersController < ApplicationController
  before_action :login_check, only: [:index]
  before_action :owner_check, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = ShipAddressOrder.new
  end

  def create
    @order = ShipAddressOrder.new(order_params)
    @donation.save
  end


  private

  def order_params
    params.parmit(:token)
    params.require(:ship_address_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end

  def pay_item
    Payjp.api_key = "sk_test_d3d1fece86114084a8fbfdb2"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
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
