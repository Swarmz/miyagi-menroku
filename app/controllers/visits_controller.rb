class VisitsController < ApplicationController
  before_action :set_shops, only: [ :new, :create ]

  def index
    @visits = Visit.all
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = current_user.visits.new(visit_params)

    if @visit.save
      redirect_to shops_path, notice: "Visit was successfully created."
    else
      Rails.logger.debug @visit.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private
    def visit_params
      params.expect(visit: %i[shop_id menu_item rating visited_on notes])
    end

    def set_shops
      @shops = Shop.order(:name)
    end
end
