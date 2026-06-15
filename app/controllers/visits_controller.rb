class VisitsController < ApplicationController
  before_action :set_shops, only: [ :new, :create, :edit, :update ]
  before_action :set_visit, only: [ :show, :edit, :update, :destroy ]

  def index
    @visits = Visit.all
  end

  def show
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

  def edit
  end

  def update
    if @visit.update(visit_params)
      redirect_to shops_path, notice: "Visit was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @visit.destroy
    redirect_to shops_path, notice: "Visit was successfully deleted."
  end

  private
    def visit_params
      params.expect(visit: %i[shop_id menu_item rating visited_on notes])
    end

    def set_shops
      @shops = Shop.order(:name)
    end

    def set_visit
      @visit = Visit.find(params[:id])
    end
end
