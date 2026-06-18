class ShopsController < ApplicationController
  def index
    @shops = Shop.search(params[:query])
    @visits = Visit.all
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
