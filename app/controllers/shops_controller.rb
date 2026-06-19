class ShopsController < ApplicationController
  def index
    @shops = Shop.search(params[:query])
                 .by_city(params[:city])
    @visits = Visit.all
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
