class HomeController < ApplicationController
  def index
    if params[:invoice]
      @invoice = Invoice.find_by(params[:invoice])
    end
  end
end