# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

  def index
    @products = if params['category_id']
                  session[:catetory] = params['category_id']
                  Product.includes(:category).where(category_id: params['category_id']).page(params[:page]).per(8)
                else
                  session[:catetory] = ''
                  Product.includes(:category).all.page(params[:page]).per(8)
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

  def search
    # DANGER DANGER
    if session[:catetory] != ''
      @products = Product.where('category_id = ? AND  name LIKE ?', session[:catetory], "%#{params[:search_term]}%")
    else
      @products = Product.where('name LIKE ?', "%#{params[:search_term]}%")
    end
  end
end

def initialize_session
  session[:cart] ||= []
  session[:catetory] ||= ''
end

def load_cart
  @cart = Product.find(session[:cart])
end

# Get /search/?search_term=user+search+terms
