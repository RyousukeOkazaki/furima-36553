class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @fee = Fee.find(@item.fee_id)
  end
end
