class ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @visits = Visit.all
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
