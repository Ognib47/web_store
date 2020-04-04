# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :users
  def name
    province
  end
end
