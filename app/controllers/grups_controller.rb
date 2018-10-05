class GrupsController < ApplicationController
  def index
    groups = Grup.all
    render json: { groups: groups }
  end
end