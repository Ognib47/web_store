# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :user
  def name
    province
  end
end
