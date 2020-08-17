class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :text, :category, :during, :region, :ship_fee, :status).merge(user_id: current_user.id)
  end
end
