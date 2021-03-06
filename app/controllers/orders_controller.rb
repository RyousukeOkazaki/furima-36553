class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :definition, only: [:index, :create]
  before_action :redirect, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:tel, :postal_code, :city, :street, :building, :prefecture_id, :order_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def definition
    @item = Item.find(params[:item_id])
    @fee = Fee.find(@item.fee_id)
  end

  def redirect
    redirect_to root_path if @item.user_id == current_user.id || !@item.order.nil?
  end

end
