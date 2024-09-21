class AccessController < ApplicationController
  layout "fluid"
  def index
    @tags = Tag.most_popular
  end
end
