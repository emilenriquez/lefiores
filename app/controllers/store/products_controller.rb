class Store::ProductsController < ApplicationController

  def show
    @product = Store::Product.where(:id => params[:id]).first
  end
end
