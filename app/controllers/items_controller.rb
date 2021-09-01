class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :the_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @user = User.find(@item.user_id)
    @category = Category.find(@item.category_id)
    @status = Status.find(@item.status_id)
    @fee = Fee.find(@item.fee_id)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @delivery_days = DeliveryDays.find(@item.delivery_days_id)
  end

  def edit
    redirect_to items_path unless user_signed_in? && current_user.id == @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render('items/edit')
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render('items/new')
    end
  end

  def destroy
    the_item
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :fee_id, :prefecture_id,
                                 :delivery_days_id, :image).merge(user_id: current_user.id)
  end

  def  the_item
    @item = Item.find(params[:id])
  end

end
