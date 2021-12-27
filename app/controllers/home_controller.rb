class HomeController < ApplicationController
  def index
  end

  def about
    # instance variable
    @about_me = "My name is Gloria."
  end
end
