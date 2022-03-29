class ItemsController < ApplicationController
  def index
    @items = Item.all
 end

  def show
    @item = Item.find_by(id: params["id"])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create(params.require(:item).permit(:name, :price, :category_id))

    redirect_to items_path
  end

  def edit
    item = Item.joins(:category)
    @item = item.find_by(id: params["id"])
  end

  def update
    item = Item.find_by(id: params["id"])
    item.update(name: params['item']['name'], price: params['item']["price"], category_id: params['item']["category_id"])

    redirect_to items_path
  end

  def destroy
    Item.destroy_by(id: params["id"])

    redirect_to items_path
  end
end
