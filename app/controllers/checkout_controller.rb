# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    if params[:id]
      product = Product.find(params[:id])
    else params[:cart]
         cart = params[:cart]
    end

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
          amount: product.cost_cents,
          currency: 'cad',
          quantity: 1
        }
        line_item_collection << line_item
      end
    end

    if product.nil?
      redirect_ to products_url
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_item_collection,
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end
  end
end
