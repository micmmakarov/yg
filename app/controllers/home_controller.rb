class HomeController < ApplicationController
  def index
  end

  def review
    @review = Review.new(stars: params[:stars], venue:params[:type])
  end

end
