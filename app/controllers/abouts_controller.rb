# frozen_string_literal: true

class AboutsController < ApplicationController
  def show
    @about = About.first
  end
end
