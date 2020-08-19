class ItemsController < ApplicationController
  before_action :login_check, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :text, :category_id, :during_id, :region_id, :ship_fee_id, :status_id).merge(user_id: current_user.id)
  end
end
