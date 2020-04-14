# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    if params[:id]
      product = Product.find(params[:id])
      if product.nil?
        redirect_to root_path
        nil
      end
    end
    total_cost = 0
    gst = Gst.first
    province = current_user.province
    pst = Pst.find_by(province: province.province)
    puts(pst.inspect)
    order = Order.create(
      user_id: current_user.id,
      gst_rate: gst.gst_rate,
      pst_rate: pst.pst_rate
    )
    params[:cart]&.each do |cart|
      product = Product.find(cart)
      Orderproduct.create(
        order_id: order.id,
        product_id: product.id,
        purchase_price_cents: product.cost_cents,
        qty: 1
      )
      total_cost += (product.cost_cents * (1 + (gst.gst_rate + pst.pst_rate)))
    end

    order.update(total_cost: total_cost)

    line_item_collection = []
    if product
      line_item = {
        name: product.name,
        description: product.description,
        amount: product.cost_cents,
        currency: 'cad',
        quantity: 1
      }
      line_item_collection << line_item
    else
      params[:cart]&.each do |cart|
        product = Product.find(cart)
        line_item = {
          name: product.name,
          description: product.description,
          amount: product.cost_cents * (1 + (gst.gst_rate + pst.pst_rate)),
          currency: 'cad',
          quantity: 1
        }
        line_item_collection << line_item
      end
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_item_collection,
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )
    session[:cart] = []

    respond_to do |format|
      format.js # r ender app/views/checkout/create.js.erb
    end
  end
end
