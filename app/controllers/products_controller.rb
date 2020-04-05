# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

  def index
    @products = if params['category_id']
                  Product.includes(:category).where(category_id: params['category_id'])
                else
                  Product.includes(:category).all
                end
  end

  def show
    @product = Product.includes(:category).find(params['id'])
  end

  def add_to_cart
    id = params['id'].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to products_url
  end

  def remove_from_cart
    id = params['id'].to_i
    session[:cart].delete(id)
    redirect_to products_url
  end
end

private

def initialize_session
  session[:cart] ||= []
end

def load_cart
  @cart = Product.find(session[:cart])
end
