class PagesController < ApplicationController
  layout "front"

  def home
  	@homes = Home.find(1)
  end
end
