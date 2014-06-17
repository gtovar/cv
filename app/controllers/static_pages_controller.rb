class StaticPagesController < ApplicationController
  def home
    @proyects = Proyect.all
  end
end
