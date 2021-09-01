class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render('items/new')
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :fee_id, :prefecture_id,
                                 :delivery_days_id, :image).merge(user_id: current_user.id)
  end
end
