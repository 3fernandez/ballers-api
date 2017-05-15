module V1
  class CourtsController < ApplicationController
    def index
      courts = Court.all.to_a
      render json: courts
    end

    def show
      court = Court.find(params[:id])
      render json: court
    end
  end
end
