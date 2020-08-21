class ItemsController < ApplicationController
  before_action :login_check, only: [:new, :create]
  before_action :get_item, only: [:edit, :destroy, :update]

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :price, :text, :category_id, :during_id, :region_id, :ship_fee_id, :status_id).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.find(params[:id])
  end
end

