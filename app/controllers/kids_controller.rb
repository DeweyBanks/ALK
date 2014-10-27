class KidsController < ApplicationController

  def index
  end

  def new
    @kid = Kid.new
  end
end
