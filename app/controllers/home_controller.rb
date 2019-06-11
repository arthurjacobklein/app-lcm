class HomeController < ApplicationController
  def index
    @disable_nav = true;
    @disable_footer = true;
  end
end
