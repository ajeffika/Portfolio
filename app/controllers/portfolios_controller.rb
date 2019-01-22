# frozen_string_literal: true
class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[edit update show destroy]
  access all: %i[show index angular], user: { except: %i[destroy
                                                         new
                                                         create
                                                         update
                                                         edit] }, site_admin: :all
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.by_position
  end

  def angular
    @angular_portfolio_items=Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Ur Portfolio item is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def show; end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
