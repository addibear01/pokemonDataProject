class PagesController < ApplicationController
  def map
    render 'pages/map'
  end

  def about
    render 'pages/about'
  end
end
