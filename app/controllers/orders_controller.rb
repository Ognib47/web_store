# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:orderproducts).where(user_id: current_user.id)
  end

  def show
    @order = Order.includes(:orderproducts).find(params['id'])
  end
end
