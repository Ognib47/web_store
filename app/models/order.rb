# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many :orderproducts
  has_many :products, through: :orderproducts
end
