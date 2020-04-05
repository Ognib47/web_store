# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = if params['category_id']
                  Product.where(category_id: params['category_id'])
                else
                  Product.all
    end
  end

  def show
    @product = Product.includes(:category).find(params['id'])
  end
end
