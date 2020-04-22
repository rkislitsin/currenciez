class CurrenciesController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_currency, only: :show

  # GET /currencies
  def index
    @currencies = Currency.all.paginate(page: params[:page])
    render json: @currencies
  end

  # GET /currencies/1
  def show
    render json: @currency
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_currency
    @currency = Currency.find(params[:id])
  end

end
